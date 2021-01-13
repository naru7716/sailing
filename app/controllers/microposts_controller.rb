class MicropostsController < ApplicationController
  before_action :logged_in_user

  def new
    @micropost = Micropost.new
  end
end
