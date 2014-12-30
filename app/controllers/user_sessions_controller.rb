class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:user][:email], params[:user][:password])
    if @user
      redirect_back_or_to root_url, :notice => "Login successful"
    else
      flash.now[:error] = 'Login failed'
      @user = User.new
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end
end
