# The MODELS dir holds the business logic, such as constrain, typical behaviours rules
class User < ApplicationRecord
  before_save { self.email = email.downcase } 
  #So example@example.com is identical to EXAMPLE@examPle.Com
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password 
  #has_secure_password: 1)This will automatically save a securely hashed password_digest attribute to the database. 
  #2)It create a pair of attribute for (password and password_confirmation) 
  #3)Also for authenticate method, i.e >>user = User.first --> user.authenticate("password")
  validates :password, presence: true, length: { minimum: 6 }
end