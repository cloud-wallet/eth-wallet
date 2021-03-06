class Api::V1::MoneyTransfersController < Api::V1::BaseController
  def create
    result = TransferMoney.call params: transfer_params
    if result.success?
      render json: result.account
    else
      render json: result.error
    end
  end

  private

  def transfer_params
    params.permit(:sender, :sender_password, :receiver, :amount)
  end
end