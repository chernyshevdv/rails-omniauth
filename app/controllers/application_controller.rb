class ApplicationController < ActionController::Base
  # CSRF protection
  protect_from_forgery with: :exception
  before_action :set_current_user

  protected
  def set_current_user
    @current_user ||= Moviegoer.where(:id => session[:user_id]).first
    redirect_to login_path and return unless @current_user
  end
end
