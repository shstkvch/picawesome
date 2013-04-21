ActiveAdmin.register Pic do
  filter :stream
  filter :user
  filter :caption
  filter :attribution
  filter :created_at

  index do
    selectable_column
    id_column
    column :stream
    column :caption

    column :vote_count
    column :upvote_count
    column :downvote_count

    column :attribution
    column :user

    column :short_url
    default_actions
  end


  form do |f|
    f.inputs "Pic details" do
      f.input :stream
      f.input :caption
      f.input :attribution

      f.input :original_image_key
      f.input :scaled_image_key

      f.input :user
    end
    f.actions
  end


  show do |pic|
    attributes_table do
      row :id
      row :stream
      row :caption

      row :vote_count
      row :upvote_count
      row :downvote_count

      row :attribution
      row :user

      row :scaled_image_key
      row :original_image_key

      row :created_at

      row :short_url
    end
    active_admin_comments
  end
  
end
