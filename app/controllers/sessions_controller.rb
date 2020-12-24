class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:enmail].downcase)
    if user && user.authenticate(params[:sessoin][password])
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
