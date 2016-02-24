class Squirrel < ActiveRecord::Base
  default_scope { order(:created_at => :desc) }

  has_secure_password

  belongs_to :tree
  has_many :food_preferences
  has_many :preferred_foods, through: :food_preferences, source: :food

  validates :username, uniqueness: true, presence: true
  validates :color, presence: true
  validates :password, format: {with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+\z/, message:"must contain at least one symbol, number, lower case and upper case letter"}, length: {minimum: 8}
end
