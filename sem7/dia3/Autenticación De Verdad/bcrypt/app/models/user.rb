class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, :mail, :pwd, presence: true
  validates :mail, uniqueness: true

   validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def self.authenticate(usr)
    where = []
    where << "mail = ? and pwd = ?"
    where << usr[:mail]
    where << usr[:pwd]
    u = self.where(where).first
    u.nil? ? nil : u.id
  end
end
