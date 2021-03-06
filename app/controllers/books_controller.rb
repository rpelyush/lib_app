class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_params)
    flash[:success] = 'Officially updated'
    redirect_to @book
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  rescue
    flash[:notice] = "Book doesn't exist"
    redirect_to books_url
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'Book was successfully created.'
      redirect_to books_url
    else
      flash[:notice] = 'Something went wrong'
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url
  end

  private

    def book_params
      params.require(:book).permit(:title, :author, :pages, :description)
    end
end
