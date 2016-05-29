ActiveAdmin.register Train do
  permit_params :count_carriages, :train_number, carriages_attributes: [:carriage, :_destroy, places_attributes: [:place, :_destroy]], stops_attributes: [:id_stop, :id_train, :id_station, :date_arrive, :date_departure, :day_from_departure, :sort_order, :_destroy]

  config.filters = false

  show do
    h3 'Номер потягу: ' << train.train_number.to_s
    train.carriages.map do |c|
      attributes_table_for c do
        row "Вагон:" do
          c.carriage
        end
        div do
          c.places.map do |p|
            attributes_table_for p do
              row "+Місце:" do
                p.place
              end
            end
          end
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :train_number, label: 'Номер поезда'
      f.input :count_carriages, label: 'Кількість вагонів (зараз ' << train.carriages.length.to_s << ')'

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
