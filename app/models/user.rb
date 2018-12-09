class User < ApplicationRecord
    validates :firstname, presence: true, length: {minimum:1, maximum: 30}, format: { with: /\A[a-zA-Z]+\z/, message: "First name contains special characters" }
    validates :lastname, presence: true, length: {minimum:1, maximum: 30}, format: { with: /\A[a-zA-Z]+\z/, message: "Last name contains special characters" }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
    validates :pass, presence: true, length: {minimum:8, maximum:64}, confirmation: true
    validates :pass_confirmation, presence: true
end
