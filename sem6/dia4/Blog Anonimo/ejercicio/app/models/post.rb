class Post < ActiveRecord::Base
  validates :body, presence: true
  validates :title, presence: true

  has_many :pts # posts_tags
  has_many :tags, :through => :pts
end
