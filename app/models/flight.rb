class Flight < ActiveRecord::Base
  attr_accessor :id_flight, :id_route, :train_number

  belongs_to :route, foreign_key: :id_route
  belongs_to :train, foreign_key: :id_train
  has_many :tickets
end
