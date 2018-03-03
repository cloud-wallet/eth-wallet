class AuthorizeAccount < BaseInteractor
  def call
    context.fail! unless authorized_account?

    account = Account.find_by address: context.params.address
    if account.present? && account.password == context.params[:password]
      context.account = account
    else
      context.fail!
    end
  end
end