ActiveAdmin.register Purchase do
  permit_params :status

  includes :item, :user, :delivery_company

  index do
    selectable_column
    id_column
    column :item
    column :user
    column :delivery_company
    tag_column :status
    actions
  end

  form do |f|
    f.inputs do
      f.input :status
      f.input :delivery_company
    end
    f.actions
  end
end
