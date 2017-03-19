require 'faker'

def fact
  words = Faker::ChuckNorris.fact.split(" ")

  rand(1..2).times do
    words = words.split(" ") if words.class == String
    length_hash = words.group_by {|w| w.length}

    range_start = (length_hash.keys.length - 1) / 2
    range_end = length_hash.keys.length - 1

    key_to_take = length_hash.keys.sort[rand(range_start..range_end)]
    word = length_hash[key_to_take].sample

    words = words.join(" ").gsub(word, '#' + word)
  end
  words
end

1500.times do
  ActiveRecord::Base.logger.level = :info
  params = {}
  params[:title] = fact
  params[:body] = fact

  response = {} # al omitir: error Rack::Lint::LintError: header key must be a string, was Symbol
  tags = params[:title].scan(/#\w+/) + params[:body].scan(/#\w+/)
  tags.uniq!

  tags_record =[]
  tags.each do |tag_to_add|
    created_tag = Tag.new(tag: tag_to_add) # utiliso new para evitar un Rollback inicesario en caso de existir el tag

    if created_tag.valid?
      tags_record << created_tag.id if created_tag.save
    else
      tags_record << created_tag.tag_hit if created_tag.upgrade_existing?
    end
  end

  post_to_add = Post.new(params)

  if post_to_add.save
    Pt.add_post(post_to_add.id, tags_record)
    response[:success] = true
  else
    response[:success] = false
    response[:errors] = post_to_add.errors.messages
  end
  ActiveRecord::Base.logger.level = 0
end
