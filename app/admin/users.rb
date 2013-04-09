ActiveAdmin.register User do

  filter :username
  filter :email
  filter :created_at
  filter :admin

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :admin
    column :sign_in_count
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs "User details" do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin
    end

    f.actions
  end

  show do |user|
    attributes_table do
      row :id
      row :username
      row :email
      row :admin

      row :reset_password_token
      row :reset_password_sent_at
      row :sign_in_count
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
    end
    active_admin_comments
  end

end
