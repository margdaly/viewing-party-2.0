class User < ApplicationRecord
  validates :name, presence: true
  validates :password_digest, presence: true
  validates :email, uniqueness: true, presence: true

  has_secure_password

  def self.all_except(user)
    where.not(id: user)
  end
end
