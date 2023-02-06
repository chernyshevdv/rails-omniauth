class SessionsController < ApplicationController
  skip_before_action :set_current_user
  def new
    redirect_to '/auth/twitter'
  end

  def create
    auth = request.env["omniauth.auth"]
    user = Moviegoer.where(:provider => auth['provider'],
                           :uid => auth['uid'].to_s).first || Moviegoer.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to movies_path
  end

  def destroy
    byebug
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully'
    redirect_to movies_path
  end

  def failure
    flash[:notice] = "Invalid credentials!"
    redirect_to movies_path
  end
end
