class Train < ActiveRecord::Base
  self.primary_key = "id_train"

  has_many :carriages, foreign_key: :id_train
  has_many :flights, foreign_key: :id_train
  has_many :places, through: :flights, foreign_key: :id_carriage

  accepts_nested_attributes_for :flights
  accepts_nested_attributes_for :carriages
  accepts_nested_attributes_for :places

end
