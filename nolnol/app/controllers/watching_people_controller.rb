class WatchingPeopleController < ApplicationController
  def index
    @users = user_scope.paginate(page: params[:page], per_page: 10).order("users.current_sign_in_at DESC")
  end

  private

  def user_scope
    current_user ? User.where.not(id: current_user.id) : User.all
  end
end
