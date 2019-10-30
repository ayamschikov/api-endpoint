class Book < ApplicationRecord
  belongs_to :publisher
  validates :title, :copies_in_stock, presence: true
end
