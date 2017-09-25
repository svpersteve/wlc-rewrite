class ApplicationController < ActionController::Base
  check_authorization
  protect_from_forgery with: :exception
  before_action :store_location, unless: :devise_controller?
  before_action :set_paper_trail_whodunnit

  if Rails.env.production?
    force_ssl
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, notice: exception.message
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
