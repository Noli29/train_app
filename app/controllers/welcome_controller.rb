class WelcomeController < ApplicationController
  def index
    @stations = Station.all
  end
end
