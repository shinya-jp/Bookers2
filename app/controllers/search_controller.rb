class SearchController < ApplicationController

  def search
    @user_or_book = params[:option]
    @book = Book.new
    @how_search = params[:choice]

    if @user_or_book == "user"
      @users = User.search(params[:search], @user_or_book, @how_search)
    else
      @books = Book.search(params[:search], @user_or_book, @how_search)
    end
  end
 end


#   def search
#   	@model = params["search"]["model"]
#   	@content = params["search"]["content"]
#   	@hoe = params["search"]["how"]
#   	@dates = search_for(@how, @model, @content)
#   end
#   private
#   def match(model, content)
#   	if model == 'user'
#   		User.where(name: content)
#   	elsif model == 'book'
#   		Book.where(title: content)
#   	end
#   end

#   def forward(model, content)
#   	if model == 'user'
#   		User.where("name LIKE?", "#{content}%")
#   	elsif model == 'book'
#   		Book.where("title LIJE?", "#{content}%")
#   	end
#   end

#   def backward(model, content)
#   	if model == 'user'
#   		User.where("name LIKE?", "%#{content}")
#   	elsif model == 'book'
#   		Book.where("title LIJE?", "%#{content}")
#   	end
#   end

#   def partical(model, content)
#     if model == 'user'
#       User.where("name LIKE ?", "%#{content}%")
#     elsif model == 'book'
#       Book.where("title LIKE ?", "%#{content}%")
#     end
#   end

#   def search_for(how, model, content)
#   	case how
#   	when  'match'
#   		match(model, content)
#   	when 'forward'
#   		forward(model, content)
#   	when 'backward'
#   		backward(model, content)
#   	when partical
#   		partical(model, content)
# 	end
#   end
# end