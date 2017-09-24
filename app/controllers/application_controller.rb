class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  if Rails.env.production?
    force_ssl
  end
end
