require 'faker'
require 'httparty'

# Create genres
genres = 10.times.map { Genre.create!(name: Faker::Book.unique.genre) }

# Fetch books from Open Library API (example: top 10 books)
response = HTTParty.get("https://openlibrary.org/subjects/science_fiction.json?limit=10")
books = response["works"]

books.each do |book_data|
  author = Author.find_or_create_by!(name: book_data["authors"].first["name"])
  book = Book.create!(
    title: book_data["title"],
    publication_year: book_data["first_publish_year"],
    isbn: Faker::Code.isbn,
    cover_image: book_data["cover_id"] ? "https://covers.openlibrary.org/b/id/#{book_data["cover_id"]}-L.jpg" : nil,
    description: Faker::Lorem.paragraph,
    author: author
  )
  # Assign random genres
  book.genres << genres.sample(2)
  # Add reviews
  5.times do
    Review.create!(
      content: Faker::Lorem.sentence,
      rating: rand(1..5),
      reviewer_name: Faker::Name.name,
      book: book
    )
  end
end