class Ticket < ActiveRecord::Base
  attr_accessor id_ticket, id_place, id_route, id_station, stat_id_station, id_flight,
                date_arrival, date_dispatch, password_number, full_name

  belongs_to :place
  belongs_to :route
  belongs_to :flight
  belongs_to :station
end
