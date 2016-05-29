ActiveAdmin.register Route do
  permit_params :id_route, :region, :city, stations_attributes: [:id_station, :name_station, :_destroy]

  show do
    h3 route.region.to_s << ', ' << route.city.to_s
    attributes_table do
      route.stations.map do |s|
        row 'Назва станції:' do
          s.name_station
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :region, label: 'Регіон:'
      f.input :city, label: 'Місто:'
      f.has_many :stations, heading: 'Зупинки', allow_destroy: true, new_record: true do |s|
        s.input :name_station, label: 'Назва зупинки:'
      end
    end
    f.actions
  end

  remove_filter :stations
end
