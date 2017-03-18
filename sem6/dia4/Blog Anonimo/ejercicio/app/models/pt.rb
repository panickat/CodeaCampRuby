class Pt < ActiveRecord::Base
  belongs_to :posts
  belongs_to :tags
end
