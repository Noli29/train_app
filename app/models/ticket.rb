class Ticket < ActiveRecord::Base
  attr_accessor :id_ticket, :id_place, :id_route, :id_station, :stat_id_station, :id_flight,
                :date_arrival, :date_dispatch, :password_number, :full_name

  belongs_to :place
  belongs_to :route
  belongs_to :flight
  belongs_to :station

  validates :password_number, presence: true, length: { maximum: 8}
  validates :full_name, presence: true, length: { maximum: 80}

  validates_format_of :date_arrival, :with => /\d{2}\/\d{2}\/\d{4}/,
                      :message => "^Date must be in the following format: mm/dd/yyyy"

  validates_format_of :date_dispatch, :with => /\d{2}\/\d{2}\/\d{4}/,
                      :message => "^Date must be in the following format: mm/dd/yyyy"
end
