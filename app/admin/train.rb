ActiveAdmin.register Train do
    permit_params :train_number, carriages_attributes: [:carriage, :_destroy, places_attributes: [:place, :_destroy]]

    config.filters = false

    form do |f|
        f.inputs do
            f.input :train_number
            f.has_many :carriages, heading: 'Вагоны',  new_record: true do |c|
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
