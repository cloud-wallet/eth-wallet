class Api::V1::AccountsController < Api::V1::BaseController
  def create
    result = CreateAccount.call(password: params[:password])
    if result.success?
      render json: result.account
    else
      rrender json: result.errors
    end
  end
end