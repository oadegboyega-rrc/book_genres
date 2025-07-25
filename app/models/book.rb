class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews
  has_many :book_genres
  has_many :genres, through: :book_genres
  validates :title, :isbn, presence: true
end