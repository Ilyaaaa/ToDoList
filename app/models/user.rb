class User < ApplicationRecord
    validates :firstname, presence: true, length: {minimum:1, maximum: 30}
    validates :lastname, presence: true, length: {minimum:1, maximum: 30}
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :pass, presence: true, length: {minimum:8, maximum:64}
end
