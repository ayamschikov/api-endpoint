class Publisher < ApplicationRecord
  has_many :books, dependent: :restrict_with_error
  has_many :shops, through: :books

  validates :title, presence: true
end
