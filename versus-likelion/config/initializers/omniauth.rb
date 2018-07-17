require 'sinatra'
require 'omniauth'


use Rack::Session::Cookie

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :kakao, ENV["KAKAO_CLIENT_ID"]
  provider :facebook, ENV["FACEBOOK_CLIENT_ID"], ENV["FACEBOOK_CLIENT_SECRET"]
  # 또는 Redirect Path를 설정하고 싶다면f you want to custoKAKAO_CLIENT_IDh)
  # provider :kakao, ENV['KAKAO_CLIENT_ID'], {:redirect_path => ENV['REDIRECT_PATH']}
end
