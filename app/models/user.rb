class User < ApplicationRecord
    before_create :confirmation_token
    
    validates :firstname, presence: true, length: {minimum:1, maximum: 30}
    validates :lastname, presence: true, length: {minimum:1, maximum: 30}
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
    validates :pass, presence: true, length: {minimum:8, maximum:64}, confirmation: true
    validates :pass_confirmation, presence: true

    private def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end

    def activate_email
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
      end
end
