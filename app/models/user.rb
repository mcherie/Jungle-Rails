class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  before_save { email.downcase!.strip! }

  def self.authenticate_with_credentials(email, password)
    if email.nil? || password.nil?
      return nil
    end

    user = User.find_by_email(email.strip.downcase)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end


 