class Food < ActiveRecord::Base
  has_many :food_preferences
  has_many :squirrels_who_prefer, through: :food_preferences, source: :squirrel

  validates :name, presence: true
end
