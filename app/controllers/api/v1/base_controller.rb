class Api::V1::BaseController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_token

  def authenticate_token
    api_token = authenticate_with_http_token do |key, options|
      key == ApiTokens.clients.first[1]['token']
    end
    head(:unauthorized) unless api_token
  end
end
