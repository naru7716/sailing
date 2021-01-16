class MicropostsController < ApplicationController
  before_action :logged_in_user

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

  private

    def micropost_params
      params.require(:micropost).permit(:name, :discription, :time, :team, :maintenance, :wind)
    end
end
