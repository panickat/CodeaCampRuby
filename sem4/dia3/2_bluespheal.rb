require 'nokogiri'
require 'open-uri'

class TwitterScrapper
  def initialize(url="lavigne")
    if ARGV.empty?
      @url = url
      @doc = Nokogiri::HTML(File.open(@url))
    else
      @url = ARGV[0]
      @doc = Nokogiri::HTML(open(@url))
    end
  end

  def extract_username
    @username = @doc.search(".ProfileHeaderCard-name > a").first.inner_text
  end

  def extract_tweets
    @tweet_text = @doc.search('.tweet-text')
    @tweet_date = @doc.search('._timestamp')
    @retweets = @doc.search('[data-modal="ProfileTweet-retweet"] .ProfileTweet-actionCountForPresentation')
    @favorited = @doc.search('.js-actionFavorite .ProfileTweet-actionCountForPresentation')
  end

  def extract_stats
    @tweets = @doc.search('[data-nav="tweets"] > .ProfileNav-value').first.inner_text
    @siguiendo = @doc.search('[data-nav="following"] > .ProfileNav-value').first.inner_text
    @seguidores = @doc.search('[data-nav="followers"] > .ProfileNav-value').first.inner_text
    @favoritos = @doc.search('[data-nav="favorites"] > .ProfileNav-value').first.inner_text
  end

  def printer
    puts "\e[#{1}m#{"\e[#{5}m#{"\e[#{7}m#{"\e[#{36}m#{"Username: #{@username}"}"}"}"}\e[0m"
    status_bar = "Stats: Tweets: #{@tweets}, Siguiendo: #{@siguiendo}, Seguidores: #{@seguidores}, Favoritos: #{@favoritos}"
    puts "\u2554" + "\u2550" * status_bar.length + "\u2557" + "\n" + "\u2551" + status_bar + "\u2551" + "\n" + "\u255A" + "\u2550" * status_bar.length + "\u255D"
    puts "\e[#{4}m#{"Tweets:"}\e[0m\n\n"
    for i in 0..2
      puts "\e[#{47}m#{"#{@tweet_date[i].inner_text}.: #{@tweet_text[i].inner_text}"}\e[0m\n" + "\e[#{47}m#{"\e[#{36}m#{"\u267B"} #{@retweets[i * 2].inner_text}, \e[#{31}m#{"\u2665"} #{@favorited[i * 2].inner_text}"}\e[0m \n\n"
    end
  end
end

prueba = TwitterScrapper.new

prueba.extract_username
prueba.extract_stats
prueba.extract_tweets

prueba.printer
