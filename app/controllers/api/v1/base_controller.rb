class Api::V1::BaseController < ActionController::API
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :null_session

  if Rails.env.production?
    force_ssl
  end

  def base_api_url
    "http://localhost:3000/api/v1"
  end
end
