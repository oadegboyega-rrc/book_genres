class Genre < ApplicationRecord
  has_many :book_genres
  has_many :books, through: :book_genres
  validates :name, presence: true, uniqueness: true
end