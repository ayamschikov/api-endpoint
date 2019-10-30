class Book < ApplicationRecord
  validates :title, :copies_in_stock, presence: true
end
