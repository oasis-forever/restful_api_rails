class Todo < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :title, presence: true
  validates :user_id, presence: true
end
