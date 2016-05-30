ActiveAdmin.register Train do
  permit_params :train_number, stops_attributes: [:id_stop, :id_train, :id_station, :date_arrive, :date_departure, :day_from_departure, :sort_order, :_destroy]

  config.filters = false

  show do |train|
    h3 'Номер потягу: ' << train.train_number.to_s

    train.stops.map do |s|
      panel 'Опис станції', only: :show do
        attributes_table_for s do
          row 'Станція: ' do
            s.station.name_station
          end

          row 'Час прибуття: ' do
            s.date_arrive.strftime('%H:%M') unless s.date_arrive.nil?
          end

          row 'Час відправлення: ' do
            s.date_departure.strftime('%H:%M') unless s.date_departure.nil?
          end
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :train_number, label: 'Номер поезда'

      f.has_many :stops, heading: 'Зупинки', allow_destroy: true, new_record: true do |s|
        s.input :id_station, label: 'Станція', as: :select, prompt: 'Виберіть станцію', collection: Station.all.map { |st| [st.name_station, st.id_station]}
        s.input :day_from_departure, label: 'День після відправлення'
        s.input :sort_order, label: 'Пріорітет'
        s.input :date_arrive, label: 'Час прибуття', as: :time_picker
        s.input :date_departure, label: 'Дата відправлення', as: :time_picker
      end
    end
    f.actions
  end

end
