class Tag < ActiveRecord::Base
  validates :tag, presence: true, uniqueness:true
  validates :hits, presence: true

  has_many :pts # posts_tags
  has_many :posts, :through => :pts

  def hit
    self.hits += 1
    self.save
  end

  def rank
    max = Tag.maximum(:hits)
    stars_range =[]
    stars = 0
    (1..4).each {|star| stars_range << (max * star) / 5}

    if self.hits >= stars_range[3]
      stars = 5
    elsif self.hits >= stars_range[2]
      stars = 4
    elsif self.hits >= stars_range[1]
      stars = 3
    elsif self.hits >= stars_range[0]
      stars = 2
    elsif self.hits < stars_range[0]
      stars = 1
    end
    stars
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
