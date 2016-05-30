class FlightStation < ActiveRecord::Base
  self.table_name = 'flightstation'

  belongs_to :flight, foreign_key: :id_flight
  belongs_to :station, foreign_key: :id_station
end
