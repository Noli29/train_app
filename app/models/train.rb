class Train < ActiveRecord::Base
  self.primary_key = :id_train

  has_many :flights, foreign_key: :id_train
  has_many :stations, through: :stops, foreign_key: :id_train
  has_many :stops, -> { order(:sort_order) }, foreign_key: :id_train

  accepts_nested_attributes_for :flights, allow_destroy: true
  accepts_nested_attributes_for :stops, allow_destroy: true
end
