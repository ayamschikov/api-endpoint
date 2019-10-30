class Publisher < ApplicationRecord
  has_many :books, dependent: :restrict_with_error

  validates :title, presence: true
end
