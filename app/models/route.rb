class Route < ActiveRecord::Base
  self.primary_key = :id_route

  has_many :stations, foreign_key: :id_route

  accepts_nested_attributes_for :stations, allow_destroy: true

  validates :region, presence: true, length: { maximum: 30}
  validates :city, presence: true, length: { maximum: 30}
end
