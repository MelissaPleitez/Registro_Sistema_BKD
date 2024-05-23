# frozen_string_literal: true

class Authentications::RegistrationsController < Devise::RegistrationsController
 include RackSessionsFix
 respond_to :json

 private

  def respond_with(current_user, _opts = {})
  token = generate_jwt_token(current_user)
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up successfully.'},
        token: token,
        data: AuthenticationsSerializer.new(current_user).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: {message: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end

  def generate_jwt_token(user)
    payload = { sub: user.id }
    secret_key = Rails.application.credentials.devise_jwt_secret_key
    JWT.encode(payload, secret_key)
  end
end
