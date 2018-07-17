class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user

  private


  # def current_user
  #   if session[:user_id].present?
  #     @current_user ||= User.find_by(uid: session[:user_id])
  #     session.clear if @current_user.nil?
  #     @current_user
  #   end
  # end

  def current_user
    if session[:user_id].present?
      @current_user = User.find_by(uid: session[:user_id])
  #     session.clear if @current_user.nil?
      return @current_user
    end
  end

  def authorize!
    redirect_to root_path unless current_user
  end
end
