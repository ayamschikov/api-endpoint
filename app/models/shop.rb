class Shop < ApplicationRecord
  has_many :books_shops, dependent: :nullify
  has_many :books, through: :books_shops

  validates :name, presence: true
end
