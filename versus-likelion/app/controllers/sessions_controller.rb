class SessionsController < ApplicationController
	def create	#로그인 시도
		@check = auth_hash
		@user_signed_check = User.where(
			uid: auth_hash[:uid],
			provider: auth_hash[:provider]).first
		
		if @user_signed_check
			@user = User.where(
				uid: auth_hash[:uid],
				provider: auth_hash[:provider]).first
			@user.provider =  auth_hash[:provider]
			@user.name = auth_hash[:info][:name]
			@user.image = auth_hash[:info][:image]
			@user.token =  auth_hash[:credentials][:token]
			@user.refresh_token =  auth_hash[:credentials][:refresh_token]
			@user.expires_at = auth_hash[:credentials][:expires_at]
			@user.expires =  auth_hash[:credentials][:expires]

			@user.save

			session[:user_id] = @user.uid
			redirect_to "/"
		else
			@user = User.where(
				uid: auth_hash[:uid],
				provider: auth_hash[:provider],
				name: auth_hash[:info][:name],
				image:auth_hash[:info][:image],
				token: auth_hash[:credentials][:token],
				refresh_token: auth_hash[:credentials][:refresh_token],
				expires_at: auth_hash[:credentials][:expires_at],
				expires: auth_hash[:credentials][:expires]).create
				# self.current_user = @user
			
				session[:user_id] = @user.uid
			
				redirect_to '/success'
		end
	end
	
	
	
	
	def destroy		#로그아웃
		session.clear
		redirect_to '/'
	end
	
	def admin_checker
		if current_user.admin == true
			redirect_to '/admin/8b359caf9a498b83459dd2c7f2c21e53'
		else
			redirect_to '/'
		end
	end
	
	protected

	def auth_hash
		request.env['omniauth.auth']
	end
	
end
