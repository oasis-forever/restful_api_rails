class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :todos, foreign_key: :user_id

  # Validations
  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
