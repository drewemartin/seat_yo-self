class User < ActiveRecord::Base
  has_secure_password

  has_many :reservations

  validates_presence_of :name
end
