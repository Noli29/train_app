class Route < ActiveRecord::Base
  attr_accessor :id_route, :region, :city

  has_many :stop
  has_many :ticket
  has_many :flight

  validates :region, presence: true, length: { maximum: 30}
  validates :city, presence: true, length: { maximum: 30}
end
