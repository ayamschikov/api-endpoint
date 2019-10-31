class Book < ApplicationRecord
  belongs_to :publisher
  has_many :books_shops, dependent: :nullify
  has_many :shops, through: :books_shops
  validates :title, :copies_in_stock, presence: true
end
