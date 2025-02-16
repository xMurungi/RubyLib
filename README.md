# Book Management System

A Ruby on Rails application for managing books with ISBN validation.

## Prerequisites

- Ruby 3.2.0 or higher
- Rails 7.0.0 or higher
- PostgreSQL (or your preferred database)

## Setup

1. Clone the repository

2. Install dependencies

3. Setup database

## Running the Application

Start the Rails server:

```bash
rails server
```

The application will be available at `http://localhost:3000`

## Running Tests

Run all tests:
```bash
rails test
```

Run specific test file:
```bash
rails test test/models/book_test.rb
```

## Database Schema

The application uses the following schema for the Book model:

```ruby
create_table "books", force: :cascade do |t|
  t.string "title", null: false
  t.string "author", null: false
  t.string "isbn", null: false
  t.timestamps
  t.index ["isbn"], name: "index_books_on_isbn", unique: true
end
```

## Model Validations

Books are validated for:
- Presence of title, author, and ISBN
- Uniqueness of ISBN

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

