post "/add_post" do
  content_type :json
  response = {} # al omitir: error Rack::Lint::LintError: header key must be a string, was Symbol
  tags = params[:body].scan(/#\w+/)

  tags_record =[]
  tags.each do |tag_to_add|
    created_tag = Tag.new(tag: tag_to_add) # utiliso new para evitar un Rollback inicesario en caso de existir el tag

    if created_tag.valid?
      tags_record << created_tag.id if created_tag.save
    else
      tags_record << created_tag.taken_id if created_tag.exist?
    end
  end

  post_to_add = Post.new(params)

  if post_to_add.save
    response[:success] = true
  else
    response[:success] = false
    response[:errors] = post_to_add.errors.messages
  end

  response.to_json
end
