class FlightsController < ApplicationController

  respond_to :html, :js

  def index
    @flights = Flight.order("id_flight")
  end

  def show
    @flight = Flight.find(params[:id_flight])
  end

  private

  def train_params
    params.require(:flight).permit(:id_flight, :id_route, :id_train)
  end
end
