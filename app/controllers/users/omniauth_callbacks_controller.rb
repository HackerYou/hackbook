class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    render json: request.env["omniauth.auth"]
  end
end
