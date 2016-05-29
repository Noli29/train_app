class Stop < ActiveRecord::Base
  belongs_to :train, foreign_key: :id_train
  belongs_to :station, foreign_key: :id_station
end
