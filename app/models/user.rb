# app/models/user.rb
class User < ApplicationRecord
  include Clearance::User

  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def self.create_with_params(user_params)
    user = new(user_params)
    user.save
    user
  end
end
