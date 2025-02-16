class Book < ApplicationRecord
  has_many :borrowings
  has_many :users, through: :borrowings
  
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
  
  def available?
    borrowings.where(returned_at: nil).empty?
  end
  
  def current_borrowing
    borrowings.find_by(returned_at: nil)
  end
end 