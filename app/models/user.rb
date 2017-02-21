class User < ApplicationRecord
  include Clearance::User

  def self.create_with_auth_and_hash(authentication, auth_hash)
  	byebug
  		user = User.create(first_name: first_name, last_name: last_name, email: auth_hash["extra"]["raw_info"]["email"])
      user.authentications << (authentication)      
      return user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end


end
