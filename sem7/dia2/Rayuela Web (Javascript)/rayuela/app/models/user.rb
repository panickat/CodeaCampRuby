class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_one :game # singular por ser entre modelos, se usa has_one por que game guarda el index de users

  def self.authenticate(users)
    players = []
    users.each do |k,v|
      v.gsub!(" ","_")
      hash = {}
      hash[v] = (user_id = user_taken?(v)) ? user_id : User.create!(name: v).id
      players << hash
    end
    players
  end

  private
  def self.user_taken?(user)
    u = User.where("name = ?", user).first
    u.nil? ? nil : u.id
  end
end
