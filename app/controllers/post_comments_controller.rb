class PostCommentsController < ApplicationController
  def create
    book = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
def show
    @book = PostImage.find(params[:id])
    @post_comment = PostComment.new　
    end
    
end
