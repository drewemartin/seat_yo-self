class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, :through => :reservations

  validates :name, :cuisine, :address, :capacity, :presence => true

  # validate :capacity, :numericality => {:only_integer => true}
  validate :capacity_is_less_than_one_hundred

  def has_availability?(proposed_reservation)
    # 1. Get all reservations for this restaurant
    # 2. Filter the reservations by the time of the proposed reservation
    # 3. Sum the party_sizes of all reservations
    reserved_seats = reservations
                      .where(:reservation_date => proposed_reservation.reservation_date)
                      .sum(:party_size)

    # 4. Check if capacity - party_sizes >= proposed reservation party size
    capacity - reserved_seats >= proposed_reservation.party_size
  end

  private

  def capacity_is_less_than_one_hundred
    if capacity.present?
      errors.add(:capacity, "should be greater than zero") if capacity < 1
      errors.add(:capacity, "should be less than one hundred") if capacity > 100
    end
  end
end
