require "json"
class JsonWebToken
    SECRET_KEY = Rails.application.secrets.secret_key_base. to_s
  
    def self.encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end
  
    def self.decode(token)
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new decoded
    end

    def self.valid?(value)
      result = JSON.parse(value)
      result.is_a?(Hash) || result.is_a?(Array)
      rescue JSON::ParserError, TypeError
        false
    end
end