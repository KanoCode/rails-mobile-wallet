class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :payments, through: :transactions

  validates :name, presence: true, length: { maximum: 255 }
  has_one_attached :icon
end
