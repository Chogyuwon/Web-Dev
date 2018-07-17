class CommentsController < ApplicationController
    
    def create
        @comment = Comment.new
        @comment.post_id = params[:post_id]
        @comment.user_id = params[:user_id]
        @comment.content = params[:comment]
        @comment.choice = params[:choice]
        @comment.save
        
        @comments_1 = Comment.where(:post_id => params[:post_id], :choice => "1").reverse
        @comments_2 = Comment.where(:post_id => params[:post_id], :choice => "2").reverse
        @comments_all = Comment.where(:post_id => params[:post_id]).reverse
        @comments_1_count = @comments_1.count
        @comments_2_count = @comments_2.count
        @comments_all_count = @comments_all.count

        @created_at = @comment.created_at.strftime("%I:%M %P")
        user = User.where(:id => params[:user_id]).first
        @user_id = user.id
        @user_name = user.name
        @user_image = user.image
        ActionCable.server.broadcast("comments", {
            comment_id: @comment.id,
            post_id: params[:post_id], 
            user_id: params[:user_id],
            content: params[:comment], 
            choice: params[:choice],
            user_id: @user_id,
            user_name: @user_name,
            user_image: @user_image,
            created_at: @created_at,
            comments_1_count: @comments_1_count,
            comments_2_count: @comments_2_count,
            comments_all_count: @comments_all_count
        })
    end

    def update  #댓글 수정
        @comment = Comment.find(params[:comment_id])
        @comment.content = params[:content]
        @comment.save
    end
    
    def destroy #댓글 삭제
        @comment = Comment.find(params[:comment_id])
        @comment.destroy
        
    end
end
