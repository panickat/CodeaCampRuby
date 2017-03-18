class Tag < ActiveRecord::Base
  validates :tag, presence: true, uniqueness:true
  validates :hits, presence: true

  has_many :pts # posts_tags
  has_many :posts, :through => :pts

  def hit
    self.hits += 1
    self.save
  end

  after_validation :busy_tag?

  def busy_tag?
    unless self.errors.details.empty?
      unless self.errors.details[:tag].empty?
        if self.errors.details[:tag].first[:error] == :taken
          @tag_to_hit = Tag.where("tag = ?", self.tag).first
        end
      end
    end
  end
  def tag_hit
    @tag_to_hit.id
  end

  def upgrade_existing?
    @tag_to_hit.nil? ? false : @tag_to_hit.hit
  end

end
