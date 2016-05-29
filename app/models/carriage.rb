class Carriage < ActiveRecord::Base
  self.primary_key = :id_carriage

  belongs_to :train, foreign_key: :id_train
  has_many :places, foreign_key: :id_carriage

  accepts_nested_attributes_for :places, allow_destroy: true
end
