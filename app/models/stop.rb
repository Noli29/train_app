class Stop < ActiveRecord::Base
  attr_accessor id_route, id stop, id_station, transit

  belongs_to :route
  belongs_to :station
end
