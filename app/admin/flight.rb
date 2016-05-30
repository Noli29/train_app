ActiveAdmin.register Flight do
  permit_params :id_train, :date_start, :count_carriages

  show do |flight|
    h3 'Номер потягу: ' << flight.train.train_number.to_s << ', кількість вагонів: ' << flight.carriages.length.to_s
    div do
      h4 'Дата відправлення: ' << flight.date_start.strftime('%F')
    end

    div do

      flight.flight_stations.map do |fs|
        panel 'Зупинка: ' do
          attributes_table_for fs do
            row 'Станція: ' do
               fs.station.name_station
            end

            row 'Дата прибуття: ' do
              fs.date_arrive.strftime('%H:%M %d %B %Y') unless fs.date_arrive.nil?
            end

            row 'Дата відправлення: ' do
              fs.date_departure.strftime('%H:%M %d %B %Y') unless fs.date_departure.nil?
            end
          end
        end
      end
    end
  end

  form do |f|
    f.inputs 'Направлення' do
      f.input :train, label: 'Потяг', as: :select, collection: Train.all.map { |t| [t.train_number, t.id_train]}, include_blank: 'Виберіть потрібний потяг'
      f.input :count_carriages, label: 'Кількість вагонів (зараз ' << flight.carriages.length.to_s << ')'
      f.input :date_start
    end

    f.actions
  end

  remove_filter :route, :train, :tickets, :carriages, :flight_stations

end
