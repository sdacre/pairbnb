class User < ApplicationRecord
  include Clearance::User
  has_many :authentications
  def self.create_with_auth_and_hash(authentication, auth_hash)

  		user = User.new(first_name: auth_hash["extra"]["raw_info"]["first_name"], last_name: auth_hash["extra"]["raw_info"]["last_name"], email: auth_hash["extra"]["raw_info"]["email"])

      user.authentications << (authentication)  
      user.save    
      return user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end


  def password_optional?
    true if self.authentications.any?
  end

end
