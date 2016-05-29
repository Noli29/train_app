class Train < ActiveRecord::Base
  self.primary_key = :id_train

  COUNT_PLACES = 30

  attr_accessor :count_carriages

  has_many :carriages, foreign_key: :id_train
  has_many :flights, foreign_key: :id_train
  has_many :places, through: :flights, foreign_key: :id_carriage
  has_many :stops, foreign_key: :id_train
  has_many :stations, through: :stops, foreign_key: :id_train

  accepts_nested_attributes_for :flights, allow_destroy: true
  accepts_nested_attributes_for :stops, allow_destroy: true
  accepts_nested_attributes_for :carriages, allow_destroy: true
  accepts_nested_attributes_for :places, allow_destroy: true

  before_save do |record|
    if record.count_carriages.to_i > record.carriages.length
      if record.carriages.length == 0
        i = 0
        while record.count_carriages.to_i > i
          carriage = Carriage.new
          carriage.train = record
          carriage.carriage = i + 1
          carriage.save
          i += 1

          (1..COUNT_PLACES).each do |p|
            place = Place.new
            place.carriage = carriage
            place.place = p
            place.save
          end
        end
      else
        i = record.carriages.length

        while record.count_carriages.to_i > i
          carriage = Carriage.new
          carriage.train = record
          carriage.carriage = i + 1
          carriage.save
          i += 1

          (1..COUNT_PLACES).each do |p|
            place = Place.new
            place.carriage = carriage
            place.place = p
            place.save
          end
        end
      end
    elsif record.count_carriages.to_i < record.carriages.length

      i = record.count_carriages.to_i

      while record.carriages.length > i
        record.carriages.destroy
        i -= 1
      end
    end
  end
end
