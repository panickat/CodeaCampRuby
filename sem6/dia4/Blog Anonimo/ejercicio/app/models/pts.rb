class Pts < ActiveRecord::Base
  has_many :posts
  has_many :tags
end
