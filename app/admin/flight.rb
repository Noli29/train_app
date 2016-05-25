ActiveAdmin.register Flight do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form do |f|
    f.inputs 'Направлення' do
      f.input :route, label: 'Направлення', member_label: Proc.new {|r| "#{r[:city]}, #{r[:region]}" }, include_blank: "Виберіть потрібне направлення"
      f.input :train, label: 'Потяг', member_label: Proc.new {|t| t[:train_number] }, include_blank: "Виберіть потрібний потяг"
    end

    f.actions
  end

  remove_filter :route, :train, :tickets

end
