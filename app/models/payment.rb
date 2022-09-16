class Payment < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :categories, through: :transactions

  validates :name, :amount, presence: true
end
