class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_location, unless: :devise_controller?

  if Rails.env.production?
    force_ssl
  end

  def store_location
    session[:previous_url] = request.fullpath if request.fullpath.match? %r{members/}
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def current_user
    current_member if current_member
  end
end
