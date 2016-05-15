class Route < ActiveRecord::Base
  attr_accessor id_route, region, city

  has_many :stop
  has_many :ticket
  has_many :flight
end
