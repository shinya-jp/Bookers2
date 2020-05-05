class BookCommentsController < ApplicationController
	def create
		book =Book.find(params[:book_id])
		comment = current_user.book_comments.new(book_comment_params)
		comment.book_id =book.id
			if comment.save
			redirect_back(fallback_location: root_path)
		else
			redirect_back(fallback_location: root_path)
		end
	end

	def destroy
		book = Book.find(params[:book_id])
		@book_comment = book.book_comments.find(params[:id])
		@book_comment.destroy
		redirect_back(fallback_location: root_path)
	end
	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
