class Landlord < ApplicationRecord
  has_secure_password
  validates :name, :company_email, :company_phone_number, :password, :password_confirmation, presence: true
  validates :company_email, uniqueness: true, confirmation: { case_sensitive: false }
  validates :name, length: { minimum: 2, maximum: 32 }
  validates :password, length: { minimum: 6, maximum: 64 }
  validates :company_phone_number, uniqueness: true, length: { is: 10 }

  #   password validation
  validates_format_of :password, with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z\d])\S{6,}\z/,
                                 message: "must include at least one lowercase letter, one uppercase letter, one digit, and one special character"

  validates_format_of :company_email, with: URI::MailTo::EMAIL_REGEXP
  validates_format_of :company_email, with: /\Aesmark04@gmail\.com\z/i, message: "must be the correct company email"
end
