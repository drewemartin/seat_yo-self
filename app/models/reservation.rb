class Reservation < ActiveRecord::Base
  validates :party_size, :numericality => {:only_integer => true}

  belongs_to :user
  belongs_to :restaurant
end
