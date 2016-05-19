class TrainsController < ApplicationController

  def index
    @tickets = Ticket.order("train_number").page(params[:page]).per(4)
  end
end
