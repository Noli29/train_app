class Route < ActiveRecord::Base
  attr_accessor :id_route, :region, :city

  has_many :stops, foreign_key: "id_route"
  has_many :tickets
  has_many :flights, foreign_key: "id_route"

  validates :region, presence: true, length: { maximum: 30}
  validates :city, presence: true, length: { maximum: 30}
end
