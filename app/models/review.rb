class Review < ApplicationRecord
  belongs_to :book
  validates :content, :rating, :reviewer_name, presence: true
end