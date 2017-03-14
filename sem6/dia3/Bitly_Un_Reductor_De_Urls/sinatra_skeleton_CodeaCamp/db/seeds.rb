def get_shorten
  xyz = ("a".."z").to_a
  url = ""
  5.times {url += xyz.sample}
  url
end

5.times do
  Url.create(
    long_url: ["http://google.com","http://yahoo.com","http://msn.com"].sample, short_url: get_shorten
  )
end
