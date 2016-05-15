class Station < ActiveRecord::Base

  attr_accessor id_station, name_station

  has_many :stop
  has_many :ticket

end
