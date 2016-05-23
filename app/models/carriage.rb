class Carriage < ActiveRecord::Base
  attr_accessor :id_carriage, :train_number

  belongs_to :train
  has_many :place
end
