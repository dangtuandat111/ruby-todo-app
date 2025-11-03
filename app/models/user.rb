class User < ApplicationRecord
  include BCrypt

  def password=(new_password)
    self.hash_pw = Password.create(new_password)
  end

  def authenticate(password)
    Password.new(self.hash_pw) == password
  end
end
