class Account
  include Mongoid::Document
  include BCrypt

  field :password_hash, type: String
  field :address, type: String
  field :encrypted_key_info, type: Hash

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end


