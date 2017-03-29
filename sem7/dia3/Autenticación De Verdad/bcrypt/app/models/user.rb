class User < ActiveRecord::Base
  include BCrypt

  validates :name, :mail, :pwd, presence: true
  validates :mail, uniqueness: true

   validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

   def pwd
      @password ||= Password.new(password_digest)
    end

    def pwd=(user_password)
      @password = Password.create(user_password)
      self.password_digest = @password
    end

  def self.authenticate(usr)
    user = User.find_by(mail: usr[:mail])
    if user && (user.pwd == usr[:pwd])
      return user
    else
      nil
    end
  end
end
