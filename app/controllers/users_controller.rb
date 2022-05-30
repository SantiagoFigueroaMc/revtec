class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

  private


  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {}).permit(:email, :password)
  end
  
end
