class TransferMoney < BaseInteractor
  def call
    context.fail! unless authorized_account?

    params = context.params
    formatter = Ethereum::Formatter.new
    amount = EthClient.int_to_hex(formatter.to_wei(params[:amount]))
    tx = { from: params[:sender], to: params[:receiver], value: amount }
    res = EthClient.personal_send_transaction(tx, params[:sender_password])
    context.transaction = res['result']
  rescue IOError => e
    context.fail!
  end

  private

  def authorized_account?
    account = Account.find_by address: context.params.address
    account.present? && account.password == context.params[:password]
  end
end