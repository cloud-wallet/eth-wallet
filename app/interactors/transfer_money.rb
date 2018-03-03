class TransferMoney < BaseInteractor
  include Interactor::Organizer
  organize AuthorizeAccount

  def call
    params = context.params
    formatter = Ethereum::Formatter.new
    amount = EthClient.int_to_hex(formatter.to_wei(params[:amount]))
    tx = { from: params[:sender], to: params[:receiver], value: amount }
    res = EthClient.personal_send_transaction(tx, params[:sender_password])
    context.transaction = res['result']
  rescue IOError => e
    context.fail!
  end
end