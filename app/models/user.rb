class User < ApplicationRecord
  include Clearance::User

  attr_accessor :password_confirmation

  validates_confirmation_of :password
end
