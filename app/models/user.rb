class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :lastname, presence: true
    validates :name, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password,
                length: { minimum: 6 },
                if: -> { new_record? || !password.nil? }
    def to_json(options={})
        options[:except] ||= [:password_digest,:created_at,:updated_at]
        super(options)
    end
end
