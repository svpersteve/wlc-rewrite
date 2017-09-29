class Api::V1::BaseController < ActionController::API
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :null_session

  if Rails.env.production?
    force_ssl
  end

  def base_api_url
    "http://localhost:3000/api/v1"
  end

  def request_authenticated?
    request.env['QUERY_STRING'].include? "key=#{ENV['WLC_API_KEY']}"
  end

  def respond_401_unauthorized
    render status: 401, json: {
      message: "You need to include your WLC API key to do this."
    }
  end
end
