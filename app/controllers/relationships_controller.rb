class RelationshipsController < ApplicationController
	def follower
	    @user = User.find(params[:user_id])
		
	end
	def followed
		
	end
	def create
		current_user.follow(params[:user_id])
		redirect_back(fallback_location: root_path)
	end

	def destroy
		current_user.unfollow(params[:user_id])
		redirect_back(fallback_location: root_path)
	end
	def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
