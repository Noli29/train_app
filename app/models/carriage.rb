class Carriage < ActiveRecord::Base
  self.primary_key = :id_carriage

  belongs_to :flight, foreign_key: :id_flight
  has_many :places, foreign_key: :id_carriage

  accepts_nested_attributes_for :places, allow_destroy: true
end
