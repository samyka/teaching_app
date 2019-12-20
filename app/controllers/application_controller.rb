  class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_user_timezone

  def default_serializer_options
    {root: false}
  end

  def set_user_timezone
    Time.zone = current_user.city_time_zone if current_user.present?
  end


  def current_user
  	if !User.find_by_id(session[:user_id])
  		session[:user_id] = nil
  	end
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user
end
