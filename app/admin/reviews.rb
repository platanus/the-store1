ActiveAdmin.register Review do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :comment, :item_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:comment, :item_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  includes :item, :user

  index do
    selectable_column
    id_column
    column :item
    column :user
    actions
  end

  show do
    attributes_table do
      row :item
      row :user
      row :comment
    end
  end

  form do |f|
    f.inputs do
      f.input :item_id
      f.input :user_id
      f.input :comment
    end
    f.actions
  end
end
