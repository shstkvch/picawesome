ActiveAdmin.register Shortlink do
  menu label: "Short links"

  filter :slug
  filter :nsfw
  filter :counter
  filter :id

  index do
    selectable_column
    id_column
    column :short_url do |link|
      link_to link.short_url, link.short_url
    end
    column :reference do |link|
      link_to link.reference, link.reference
    end

    column :counter
    column :created_at

    default_actions
  end

  form do |f|
    f.inputs "Short link details" do
      f.input :slug
      f.input :reference
    end
    f.actions
  end

  show do |shortlink|
    attributes_table do
      row :id
      row :short_url
      row :slug
      row :reference

      row :created_at
      row :updated_at
    end
    active_admin_comments
  end


end
