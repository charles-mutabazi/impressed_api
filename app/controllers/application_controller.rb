class ApplicationController < ActionController::API
  # acts_as_token_authentication_handler_for User
  respond_to :json
  # acts_as_token_authentication_handler_for Admin
  # protect_from_forgery with: :null_session
  # before_filter :authenticate_user!
end
