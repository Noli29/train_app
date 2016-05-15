class Place < ActiveRecord::Base
  attr_accessor id_place, id_ticket, id_carriage, train_number, place

  has_many :ticket
  belongs_to :carriage
end
