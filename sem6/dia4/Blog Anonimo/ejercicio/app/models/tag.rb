class Tag < ActiveRecord::Base
  validates :tag, presence: true, uniqueness:true

  has_many :pts # posts_tags
  has_many :posts, :through => :pts

  after_validation :taken_id

  def taken_id
    @exist = false
    unless self.errors.details.empty?
      unless self.errors.details[:tag].empty?
        Tag.where("tag = ?", self.tag).first.id if self.errors.details[:tag].first[:error] == :taken
        @exist = true
      end
    end
  end

  def exist?
    @exist
  end

end
