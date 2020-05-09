class BookCommentsController < ApplicationController

	def create
		@book =Book.find(params[:book_id])
		@book_comment = @book.book_comments.build(book_comment_params)
		@book_comment.user_id = current_user.id
		if @book_comment.save
			render :index
		else
			render :index
		end
	end

	def destroy
		@book = Book.find(params[:book_id])
		@book_comment = @book.book_comments.find(params[:id])
		@book_comment.destroy
		render :index
	end
	private
	def book_comment_params
		params.require(:book_comment).permit(:comment, :book_id, :user_id)
	end
end
