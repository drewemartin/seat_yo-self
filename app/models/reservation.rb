class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :party_size, :numericality => {:only_integer => true}
  validate  :at_capacity


  private
  def at_capacity
    if !restaurant.has_availability?(self)
      errors.add(:party_size => "there isn't enough space to accommodate you. Sorry!")
    end
  end
end
