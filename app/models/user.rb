class User < ApplicationRecord
  has_secure_password
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :username, :email, :password_digest, :name, presence: true 
 
  has_many :alibis
end
