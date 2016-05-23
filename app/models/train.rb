class Train < ActiveRecord::Base
  attr_accessor :train_number

  has_many :carriages, foreign_key: "train_number"
  has_many :flights
end
