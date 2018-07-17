class HomeController < ApplicationController
  
  
  def index   #메인페이지
      @posts = Post.order(created_at: :desc).page params[:page]
      @speakers = Speaker.all.reverse
  end

  def success #초기가입시 추가정보 입력창
    # @current_user =  User.where(uid: session[:user_id]).first
  end
  
  def extra_info  #초기가입시 추가정보 저장
    @current_user = User.find(params[:user])
    @current_user.age = params[:userage]
    @current_user.gender = params[:usergender]
    @current_user.nickname = params[:nickname]
    
    if(params[:email] != nil)
      @current_user.email = params[:email]
    end
    
    if(params[:area] != nil)
      @current_user.area = params[:area]
    end
    
    @current_user.save
    redirect_to '/'
  end
  
  def mypage    #마이페이지
    
  end
  
  def speaker_create  #메인화면에서 확성기 쓰기
    
  end
  
  def edit_info   #개인정보수정 입력창
  end
  
  def update_info #개인정보수정 저장
    @current_user = User.find(params[:user_id])
    @current_user.age = params[:userage]
    @current_user.gender = params[:usergender]
    @current_user.nickname = params[:nickname]
    
    if(params[:email] != nil)
      @current_user.email = params[:email]
    end
    
    if(params[:area] != nil)
      @current_user.area = params[:area]
    end
    
    @current_user.save
    redirect_to '/mypage'
  end
end

