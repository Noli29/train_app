ActiveAdmin.register Flight do
  permit_params :id_train, :date_start

  show do
    h3 'Номер потягу: ' << flight.train.train_number.to_s
    div do
      h4 'Дата відправлення: ' << flight.date_start.strftime('%F')
    end
  end

  form do |f|
    f.inputs 'Направлення' do
      f.input :train, label: 'Потяг', member_label: Proc.new {|t| t[:train_number] }, include_blank: "Виберіть потрібний потяг"
      f.input :date_start
    end

    f.actions
  end

  remove_filter :route, :train, :tickets

end
