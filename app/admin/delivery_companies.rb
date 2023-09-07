ActiveAdmin.register DeliveryCompany do
  permit_params :name, :phone_number

  index do
    selectable_column
    id_column
    column :name
    column :phone_number
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :phone_number
    end
    f.actions
  end
end
