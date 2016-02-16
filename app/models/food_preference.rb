class FoodPreference < ActiveRecord::Base
  belongs_to :squirrel
  belongs_to :food

  validates_presence_of :squirrel, :food
end
