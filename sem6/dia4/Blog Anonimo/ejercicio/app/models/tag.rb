class Tag < ActiveRecord::Base
  validates :tag, presence: true

  has_many :pts # posts_tags
  has_many :posts, :through => :pts
end
