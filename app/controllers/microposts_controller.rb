class MicropostsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update]

  def show
    @micropost = Micropost.find(params[:id])
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿が作成されました！"
      redirect_to micropost_path(@micropost)
    else
      render 'microposts/new'
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(micropost_params)
      flash[:success] = "投稿が更新されました！"
      redirect_to @micropost
    else
      render 'microposts/edit'
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    if current_user.admin? || current_user?(@micropost.user)
      @micropost.destroy
      flash[:success] = "投稿が削除されました"
      redirect_to
      request.referrer == user_url(@micropost.user) ? user_url(@micropost.user) : root_url
    else
      flash[:danger] = "他人の投稿は削除できません"
      redirect_to root_url
    end
  end

  private

    def micropost_params
      params.require(:micropost).permit(:name, :discription, :time, :team, :maintenance, :wind)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
