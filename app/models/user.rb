class User < ApplicationRecord
	before_save :downcase_email
	validates :name, 	presence: true, length: { minimum: 4, maximum: 50 }
	validates :email, presence: true, length: {  maximum: 240 }, 
										format: { with: URI::MailTo::EMAIL_REGEXP },
										uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
	has_secure_password

	private
		# Converts email to lowercase for uniqueness
		def downcase_email
			self.email = email.downcase
		end
end
