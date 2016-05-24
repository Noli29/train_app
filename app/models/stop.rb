class Stop < ActiveRecord::Base
  attr_accessor :id_route, :id_stop, :id_station, :transit

  belongs_to :route, foreign_key: "ID_route"
  belongs_to :station, foreign_key: "ID_station"
end
