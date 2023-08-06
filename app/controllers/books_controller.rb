class BooksController < ApplicationController

  def new
    @book = new
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
      @books  =  Book.all
      @book= Book.new
      @user = current_user
  end

  def show
     @book = Book.find(params[:id])
     @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book =  Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

def update
  @book = Book.find(params[:id])
  @book.update(books_params)
  if @book.save
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
  else
    render :edit
  end
end

private

  def books_params
    params.require(:book).permit(:title,:body)
  end

end
