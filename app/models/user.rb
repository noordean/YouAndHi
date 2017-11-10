class User < ApplicationRecord
  validates_presence_of :username, :password, :email, :phone_number
end
