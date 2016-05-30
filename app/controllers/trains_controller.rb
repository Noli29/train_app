class TrainsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def trains_list()
    date = Date.strptime(permit_params[:date_start], "%m/%d/%Y")

    flight_station = FlightStation.where(id_station: permit_params[:departure], :date_departure => date..date.next)

    flights = []

    flight_station.each do |fs|
      result = fs.flight.flight_stations.where(id_station: permit_params[:arrival])

      unless result.nil?
        train_data = Hash.new
        train_data[:departure] = fs
        train_data[:arrival] = result.first
        train_data[:train] = fs.flight.train
        train_data[:flight] = fs.flight

        flights << train_data
      end
    end

    @flights = flights
  end

  def permit_params
    params.permit(:departure, :date_start, :arrival)
  end
end
