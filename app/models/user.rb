class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 3 }
  
  def self.authenticate_with_credentials(email, password)
    downcase_email = email.downcase
    user = User.find_by(email: downcase_email)
    # puts user.inspect
    # puts user.authenticate(password)
    user && user.authenticate(password) # returns true or false
    # if user && user.authenticate(password)
    #   user
    # else
    #   nil
    # end
  end

end

