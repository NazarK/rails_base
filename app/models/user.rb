class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  devise :omniauthable

  def self.find_or_create email
    if user = User.where(:email => email).first
      user
    else # Create a user with a stub password.
      user = User.create!(:email => email, :password => Devise.friendly_token[0,20])
    end
  end

  def twitter_account?
     !(email =~ /^[0-9]*@twitter.com/).nil?
  end
end
