class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    render :new
  end

  def create
    author = book_params[:author]
    title = book_params[:title]
    Book.create(author: author, title: title)
    redirect_to books_url
  end

  def destroy
    Book.find_by(id: params[:id]).destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
