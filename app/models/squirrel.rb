class Squirrel < ActiveRecord::Base
  belongs_to :tree

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
