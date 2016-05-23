class Carriage < ActiveRecord::Base
  attr_accessor :id_carriage, :train_number

  belongs_to :train, foreign_key: "train_number"
  has_many :places
end
