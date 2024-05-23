# frozen_string_literal: true

class Authentications::SessionsController < Devise::SessionsController
  include RackSessionsFix
  respond_to :json

  private
  def respond_with(current_user, _opts = {})
    token = generate_jwt_token(current_user)
    render json: {
      status: { 
        code: 200, message: 'Logged in successfully.',
        token: token,
        data: { user: AuthenticationsSerializer.new(current_user).serializable_hash[:data][:attributes] }
      }
    }, status: :ok
  end
  def respond_to_on_destroy
    if request.headers['Authorization'].present? 
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, Rails.application.credentials.devise_jwt_secret_key!).first
      current_user = Authentication.find(jwt_payload['sub'])
    end
  
    
    if current_user
      render json: {
        status: 200,
        message: 'Logged out successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end

  def generate_jwt_token(user)
    payload = { sub: user.id }
    secret_key = Rails.application.credentials.devise_jwt_secret_key
    JWT.encode(payload, secret_key)
  end

end
