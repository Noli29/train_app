class Flight < ActiveRecord::Base
  COUNT_PLACES = 10

  attr_accessor :count_carriages

  belongs_to :train, foreign_key: :id_train
  has_many :tickets, foreign_key: :id_flight
  has_many :carriages, foreign_key: :id_flight
  has_many :flight_stations, foreign_key: :id_flight

  # accepts_nested_attributes_for :carriages, allow_destroy: true
  # accepts_nested_attributes_for :places, allow_destroy: true

  after_create do |record|
    i = 0
    while record.count_carriages.to_i > i
      carriage = Carriage.new
      carriage.flight = record
      carriage.carriage = i + 1
      carriage.save
      i = i + 1

      (1..COUNT_PLACES).each do |p|
        place = Place.new
        place.carriage = carriage
        place.place = p
        place.save
      end
    end

    record.train.stops.map do |s|
      f_station = FlightStation.new
      f_station.flight = record
      f_station.station = s.station
      f_station.sort_order = s.sort_order

      unless s.date_arrive.nil?
        datetime_arrive = record.date_start.next_day(s.day_from_departure)
        datetime_arrive = DateTime.new(datetime_arrive.year, datetime_arrive.month, datetime_arrive.day, s.date_arrive.hour, s.date_arrive.min, s.date_arrive.sec)

      end

      unless s.date_departure.nil?
        datetime_departure = record.date_start.next_day(s.day_from_departure)
        datetime_departure = DateTime.new(datetime_departure.year, datetime_departure.month, datetime_departure.day, s.date_departure.hour, s.date_departure.min, s.date_departure.sec)
      end

      f_station.date_arrive = datetime_arrive
      f_station.date_departure = datetime_departure

      f_station.save
    end
  end
end
