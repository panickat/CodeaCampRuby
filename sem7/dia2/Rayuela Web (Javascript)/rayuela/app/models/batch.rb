class Batch < ActiveRecord::Base
  validates :user_id, :game_id, presence: true

  belongs_to :user
  belongs_to :game
end
