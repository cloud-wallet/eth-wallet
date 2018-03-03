class CreateAccount < BaseInteractor
  def call
    password = context.password

    account = Account.new
    account.password = password

    key = Eth::Key.new
    account.address = key.address
    encrypted_key_json = Eth::Key.encrypt key, password
    account.encrypted_key_info = Oj.load(encrypted_key_json )

    if account.save
      context.account = account
    else
      context.fail!
    end
  end
end