class PostsController < ApplicationController
    
    def new     #새 글 쓰기
        #로그인 유저가 아니면 alert창을 띄우고 메인 화면으로 보냄.
        #모달로 하면 되서 안쓸 수도 있음.
        unless current_user
            render(
              html: "<script>alert('로그인 해야만 글을 쓸 수 있습니다.'); $(location).attr('href', '/');</script>".html_safe,
              layout: 'application'
            )
        end
    end
    
    def create  #새 글 쓴거 저장
        @post = Post.new
        @post.user_id = params[:user_id]
        @post.title = params[:title]
        @post.content = params[:content]
        @post.post_type = params[:post_type]
        @post.image_1 = params[:image_1]
        @post.image_2 = params[:image_2]
        @post.image_3 = params[:image_3]
        @post.use_speaker = params[:use_speaker]
        @post.category = params[:category]
        @post.first_choice_label = params[:first_choice_label]
        @post.second_choice_label = params[:second_choice_label]
        
        @post.save
        
        if params[:use_speaker] == "on"
            speaker = Speaker.new
            speaker.post_id = @post.id
            speaker.user_id = params[:user_id]
            speaker.save
        end
        redirect_to '/'
    end
    
    def show    #글 보기
        @post = Post.find(params[:post_id])
        @first_choice_count = Vote.where(:post_id => params[:post_id] ,:vote_choice => "1").count
        @second_choice_count = Vote.where(:post_id => params[:post_id], :vote_choice => "2").count
        @total_choice_count = Vote.where(:post_id => params[:post_id]).count
        
        @first_choices = Vote.where(:post_id => params[:post_id], :vote_choice => "1")
        @second_choices = Vote.where(:post_id => params[:post_id], :vote_choice => "2")
        
        @comments_1 = Comment.where(:post_id => params[:post_id], :choice => "1").reverse
        @comments_2 = Comment.where(:post_id => params[:post_id], :choice => "2").reverse
        @comments_all = Comment.where(:post_id => params[:post_id]).reverse
        @comments_1_count = @comments_1.count
        @comments_2_count = @comments_2.count
        @comments_all_count = @comments_all.count
    end
    
    def edit #글 수정
        @post = Post.find(params[:post_id])
     
    end
    
    def update  #글 수정 저장
        @post = Post.find(params[:post_id])
        @post.title = params[:title]
        @post.content = params[:content]
        @post.save
        
        redirect_to "/"
    end
    
    def destroy #글 삭제
        @post = Post.find(params[:post_id])
        @post.destroy
        
        redirect_to "/"
    end
    
    def vote_create #투표하기
        if params[:user_id] != "no_id"
            @vote = Vote.new
            @vote.user_id = params[:user_id]
            @vote.post_id = params[:post_id]
            @vote.vote_choice = params[:vote_choice]
            @vote.save
        
            first_choice_count = Vote.where(:post_id => params[:post_id],:vote_choice => "1").count
            second_choice_count = Vote.where(:post_id => params[:post_id], :vote_choice => "2").count
            total_choice_count = Vote.where(:post_id => params[:post_id]).count
            
            ActionCable.server.broadcast "vote", {
             post_id: params[:post_id],
             first_choice_count: first_choice_count,
             second_choice_count: second_choice_count,
             total_choice_count: total_choice_count
            }
        end
    end
    
    def like_create #개공감 개소리 최초 선택
    end
    
    def like_update #개공감 개소리 업데이트
    end
    
    def speaker_create  #글 상세보기 페이지 or 마이페이지에서 확성기 쓰기
        @speaker = Speaker.new
        @speaker.post_id = params[:post_id]
        @speaker.user_id = params[:user_id]
        @speaker.save
        
        redirect_to '/'
    end
    
    def speaker_destroy #마이페이지에서 확성기 지우기
        @speaker = Speaker.find_by(post_id: params[:post_id])
        @speaker.destroy
        
        redirect_to '/mypage'
    end
    
end
