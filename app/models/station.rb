class Station < ActiveRecord::Base

  attr_accessor :id_station, :name_station

  has_many :stops, foreign_key: "ID_station"
  has_many :tickets, foreign_key: "ID_station"
  has_many :tickets, foreign_key: "Stat_ID_station"

  validates :name_station, presence: true, length: { maximum: 30}
end
