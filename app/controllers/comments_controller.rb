class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
    @comment.user_id = current_user.id
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      redirect_to topics_path, success: "投稿に成功しました"
    else 
      redirect_to topics_path, success: "投稿に失敗しました"
    end     
    
  end

  def destroy
    @comment = Comment.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    @comment.destroy
    redirect_to topics_path, success: '投稿を取り消しました'    
  end
  
  private
  def comment_params
     params.require(:comment).permit(:content, :topic_id, :user_id)
  end 
  
end
