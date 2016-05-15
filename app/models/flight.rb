class Flight < ActiveRecord::Base
  attr_accessor id_flight, id_route, train_number

  belongs_to :route
  belongs_to :train
  has_many :ticket
end
