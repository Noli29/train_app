class Station < ActiveRecord::Base
  self.primary_key = :id_station

  has_many :stops, foreign_key: :id_station
  has_many :tickets, foreign_key: :id_station
  has_many :tickets, foreign_key: :stat_id_station

  validates :name_station, presence: true, length: { maximum: 30}
end
