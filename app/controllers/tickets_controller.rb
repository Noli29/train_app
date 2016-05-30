class TicketsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show_form
    @flight = Flight.find(permit_params[:id])
    # debugger

    @departure_flight = @flight.flight_stations.where(id_station: permit_params[:departure_id])[0]
    @arrival_flight = @flight.flight_stations.where(id_station: permit_params[:arrival_id])[0]
  end

  def show_ticket
    @ticket = Ticket.find(permit_params[:id])
  end

  def set_ticket
    place = Flight.find(permit_params[:flight_id]).carriages.where(carriage: permit_params[:carriage_number])[0].places.where(place: permit_params[:place_number])[0]

    if Ticket.exists?(id_place: place.id_place, id_flight: permit_params[:flight_id])
      return redirect_to(:back)
    end

    flight = Flight.find(permit_params[:flight_id])
    departure_flight = flight.flight_stations.where(id_station: permit_params[:departure_id]).first
    arrival_flight = flight.flight_stations.where(id_station: permit_params[:arrival_id]).first

    ticket = Ticket.new
    ticket.full_name = permit_params[:full_name]
    ticket.passport_number = permit_params[:passport]
    ticket.id_station = departure_flight.station.id_station
    ticket.stat_id_station = arrival_flight.station.id_station
    ticket.id_place = place.id_place
    ticket.date_arrival = arrival_flight.date_arrive
    ticket.date_dispatch = departure_flight.date_departure
    ticket.id_flight = flight.id_flight
    ticket.save


    redirect_to("/tickets/#{ticket.id_ticket.to_s}")
  end

  def permit_params
    params.permit(:id, :arrival_id, :departure_id, :carriage_number, :place_number, :full_name, :passport, :flight_id, :id_station, :stat_id_station)
  end
end
