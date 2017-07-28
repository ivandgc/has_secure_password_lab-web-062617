class User < ActiveRecord::Base
  validates :password_digest, presence: true
  has_secure_password

end
