class Flight < ActiveRecord::Base
  belongs_to :train, foreign_key: :id_train
  has_many :tickets, foreign_key: :id_flight
end
