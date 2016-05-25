class Place < ActiveRecord::Base
  self.primary_key = :id_place

  has_many :tickets
  belongs_to :carriage, foreign_key: :id_carriage
end
