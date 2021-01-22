class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @user = @micropost.user
    @comment = @micropost.comments.build(user_id: current_user.id, content: params[:comment][:content])
    if !@micropost.nil? && @comment.save
      flash[:success] = "コメントを追加しました！"
      if @user != current_user
        @user.notifications.create(micropost_id: @micropost.id, variety: 2,
                                   from_user_id: current_user.id,
                                   content: @comment.content)
        @user.update_attribute(:notification, true)
      end
    else
      flash[:danger] = "コメントは50文字以内で入力してください"
    end
    redirect_to request.referrer || root_url
  end

  def destroy
    @comment = Comment.find(params[:id])
    @micropost = @comment.micropost
    if current_user.id == @comment.user_id
      @comment.destroy
      flash[:success] = "コメントを削除しました"
    end
    redirect_to micropost_url(@micropost)
  end
end
