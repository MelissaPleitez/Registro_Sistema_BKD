class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
    

  private

  def authenticate_user_from_token!
    token = request.headers['Authorization']&.split(' ')&.last
    payload = JWT.decode(token, Rails.application.credentials.devise_jwt_secret_key).first
    @current_user = Authentication.find(payload['sub'])
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
  rescue JWT::DecodeError, ActiveRecord::RecordNotFound
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def current_user
    @current_user
  end
  
end
