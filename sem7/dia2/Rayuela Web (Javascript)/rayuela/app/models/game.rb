class Game < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to :user # singular por ser entre modelos, se usa belongs por contener el indice de users
end
