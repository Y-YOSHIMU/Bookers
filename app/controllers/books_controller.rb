class BooksController < ApplicationController
  def top
  end

  def index
  	@books = Book.all.order(create_at: :desc)
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  end

  def create
  	@books = Book.all.order(create_at: :desc)
  	@book = Book.new(book_params)
  	if @book.save
  		flash[:notice] = "Book was successfully created."
  	redirect_to book_path(@book)
  else
  	render action: :index
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update_attributes(book_params)
  		flash[:notice] = "Book was successfully updated."
  	redirect_to book_path(@book)
  else
  	render action: :edit
  	end
  end

  def destroy
  	@book = Book.find(params[:id])
  	if @book.destroy
  		flash[:notice] = "Book was successfully destroyed."
  	redirect_to books_path
  	end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
