require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should not save book without title" do
    book = Book.new(author: "John Doe", isbn: "1234567890")
    assert_not book.save, "Saved the book without a title"
  end
  
  test "should not save book with duplicate ISBN" do
    Book.create!(title: "Book 1", author: "Author 1", isbn: "1234567890")
    book = Book.new(title: "Book 2", author: "Author 2", isbn: "1234567890")
    assert_not book.save, "Saved the book with a duplicate ISBN"
  end
  
  test "should be available when not borrowed" do
    book = books(:one)
    assert book.available?, "Book should be available when not borrowed"
  end
end 