class Station < ActiveRecord::Base

  attr_accessor :id_station, :name_station

  has_many :stop
  has_many :ticket

  validates :name_station, presence: true, length: { maximum: 30}
end
