class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :name, presence: true

  def self.authenticate_with_credentials(email,password)
    
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
