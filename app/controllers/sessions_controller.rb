class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:email], params[:password])
      sign_in user
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to login_path, notice: 'Logged out!'
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
