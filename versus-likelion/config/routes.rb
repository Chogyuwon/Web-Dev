Rails.application.routes.draw do
  #관리자페이지
  get '/admin' => "sessions#admin_checker"
  mount RailsAdmin::Engine => '/admin/8b359caf9a498b83459dd2c7f2c21e53', as: 'rails_admin'
  
  root 'home#index' #메인페이지
  get '/auth/:provider/callback' => 'sessions#create'   #메인 페이지 로그인 시도
  get '/success' => "home#success"    #초기가입시 추가정보 입력창
  post '/success/:user' => "home#extra_info"  #초기가입시 추가정보 저장
  get '/logout' => 'sessions#destroy'   #로그아웃
  get '/mypage' => 'home#mypage'  #마이페이지
  get '/mypage/info' => 'home#edit_info'  #개인정보수정 입력창
  post '/mypage/info/update' => 'home#update_info' #개인정보수정 저장

  #글
  get '/posts/new' => 'posts#new'   #새 글 쓰기
  post '/posts/create' => 'posts#create'    #새 글 쓴거 저장
  get '/posts/:post_id' => 'posts#show' #글 보기
  get '/posts/:post_id/destroy' => 'posts#destroy'  #글 삭제
  
  #댓글
  # post '/posts/:post_id/:user_id/:comment/:choice' => 'comments#create'  #댓글 쓰기
  post '/posts/:post_id/comments' => 'comments#create'  #댓글 쓰기
  post '/posts/:post_id/:comment_id/update' => 'comments#update' #댓글 수정
  post '/posts/:post_id/:comment_id/destroy' => 'comments#destroy' #댓글 삭제

  #투표하기
  post '/posts/:post_id/:user_id/:vote_choice' => 'posts#vote_create'  #투표하기
  
  #글쓰고 난 후 확성기 사용
  post '/posts/:post_id/speaker' => 'posts#speaker_create' #글 상세보기 페이지에서 확성기 쓰기
  post '/mypage/:user_id/:post_id/speaker' => 'posts#speaker_create' #마이 페이지에서 확성기 쓰기
  post '/mypage/speaker/destroy/:post_id' => 'posts#speaker_destroy' #마이페이지에서 확성기 지우기
  
  #액션케이블 사용 프로덕션에서만!! - 디플로이 할 때만 주석 풀어주기
  mount ActionCable.server => '/cable'
end
