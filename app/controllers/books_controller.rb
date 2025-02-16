class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_book, only: [:show, :borrow, :return]
  
  def index
    @books = Book.all
  end
  
  def show
  end
  
  def borrow
    if @book.available?
      borrowing = current_user.borrowings.build(book: @book)
      if borrowing.save
        redirect_to @book, notice: 'Book was successfully borrowed.'
      else
        redirect_to @book, alert: 'Unable to borrow book.'
      end
    else
      redirect_to @book, alert: 'Book is already borrowed.'
    end
  end
  
  def return
    borrowing = @book.current_borrowing
    if borrowing && borrowing.user == current_user
      borrowing.update(returned_at: Time.current)
      redirect_to @book, notice: 'Book was successfully returned.'
    else
      redirect_to @book, alert: 'Unable to return book.'
    end
  end
  
  private
  
  def set_book
    @book = Book.find(params[:id])
  end
end 