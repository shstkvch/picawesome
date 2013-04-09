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
    column :sign_in_count
    column :admin
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


end
