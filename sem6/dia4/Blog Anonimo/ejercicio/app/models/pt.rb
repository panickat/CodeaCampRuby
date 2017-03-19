class Pt < ActiveRecord::Base
  self.primary_key = 'post_id'

  belongs_to :posts
  belongs_to :tags

  def self.add_post(post_id,tag_ids)
    tag_ids.each do |tag_id|

      Pt.create(post_id: post_id, tag_id: tag_id)
    end
  end
end
