post "/add_post" do
  content_type :json
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
  else
    response[:errors] = post_to_add.errors.messages
  end

  response.to_json
end

post "/posts_from_tag" do
  content_type :json
  response = {posts: []}

  tag = Tag.where("tag=?", params[:tag])
  post_ids = tag.first.pts.collect {|pt| pt.post_id}

  Post.where(id: post_ids.uniq).order(id: :desc).each do |post|
    tag_ids = post.pts.collect {|pt| pt.tag_id}.uniq
    tags_from_post = Tag.where(id: tag_ids).collect {|tag| tag.tag}

    post_with_tags = {post: post, tags: tags_from_post}
    response[:posts] << post_with_tags
  end

  response.to_json
end
