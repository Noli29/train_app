class Flight < ActiveRecord::Base
  attr_accessor :id_flight, :id_route, :train_number

  belongs_to :route, foreign_key: "ID_route"
  belongs_to :train, foreign_key: "train_number"
  has_many :tickets
end
