ActiveAdmin.register Train do
  permit_params :train_number, carriages_attributes: [:carriage, :_destroy, places_attributes: [:place, :_destroy]]

  config.filters = false

  show do
    h3 'Номер потягу: ' << train.train_number.to_s
    div do
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
  end

  form do |f|
    f.inputs do
      f.input :train_number, label: 'Номер поезда'
      f.has_many :carriages, heading: 'Вагоны', new_record: true do |c|
        c.input :carriage, label: 'Номер вагона'

        if !c.object.nil?
          c.has_many :places, heading: 'Місця', new_record: true do |p|
            p.input :place, label: 'Номер місця'
          end
        end
      end
    end
    f.actions
  end

end
