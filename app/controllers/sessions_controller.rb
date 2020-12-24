class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "2nd Familyへようこそ！"
      redirect_to @user
    end

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが誤っています'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
