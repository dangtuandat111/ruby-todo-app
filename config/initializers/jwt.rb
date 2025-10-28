require 'jwt'
module JsonWebToken
  SECRET = Rails.application.credentials.secret_key_base || ENV['JWT_SECRET'] || ''
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET)
  end
  def self.decode(token)
    body = JWT.decode(token, SECRET)[0]
    HashWithIndifferentAccess.new(body)
  rescue JWT::ExpiredSignature, JWT::DecodeError
    nil
  end
end