class BooksController < ApplicationController


  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book =Book.new(book_params)
    @book.user_id =current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      render 'books#index'
    end
  end

  def show
    @book = Book.new
    @books = Book.all
  end

  def edit
  end

  def update
  end

  def delete
  end
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
