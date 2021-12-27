class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome, :home]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      flash.now[:error] = "Invalid username or password"
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to welcome_path
  end

  def welcome
    render layout: false
  end

  def home
    # render layout: false
  end
end
