class Station < ActiveRecord::Base

  attr_accessor :id_station, :name_station

  has_many :stops, foreign_key: "id_station"
  has_many :tickets, foreign_key: "id_station"
  has_many :tickets, foreign_key: "stat_id_station"

  validates :name_station, presence: true, length: { maximum: 30}
end
