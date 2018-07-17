class FollowlistController < ApplicationController
    def index
            unless !user_signed_in?
    	@followedall = current_user.followers.all
    	@followingall = current_user.followings.all
    end
    end
end
