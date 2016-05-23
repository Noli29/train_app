class Train < ActiveRecord::Base
  attr_accessor :train_number

  has_many :carriage
  has_many :flight
end
