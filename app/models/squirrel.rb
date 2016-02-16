class Squirrel < ActiveRecord::Base
  default_scope { order(:created_at => :desc) }

  belongs_to :tree
  has_many :food_preferences
  has_many :preferred_foods, through: :food_preferences, source: :food

  validates :username, uniqueness: true, presence: true
  validates :color, presence: true

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(plaintext_password)
    @password = BCrypt::Password.create(plaintext_password)
    self.password_hash = @password
  end
end
