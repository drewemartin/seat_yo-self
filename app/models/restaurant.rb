class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, :through => :reservations

  validates :name, :cuisine, :address, :capacity, :presence => true

  # validate :capacity, :numericality => {:only_integer => true}
  validate :capacity_is_less_than_one_hundred

  private

  def capacity_is_less_than_one_hundred
    if capacity.present?
      errors.add(:capacity, "should be greater than zero") if capacity < 1
      errors.add(:capacity, "should be less than one hundred") if capacity > 100
    end
  end

end
