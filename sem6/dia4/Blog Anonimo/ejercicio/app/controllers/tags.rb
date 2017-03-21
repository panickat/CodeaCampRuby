post "/tags_like" do
  content_type :json

  response = Tag.where("tag like ?", params[:tag] + "%").order(hits: :desc).limit(5)

  response.to_json
end
