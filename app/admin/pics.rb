ActiveAdmin.register Pic do
  filter :stream
  filter :user
  filter :caption
  filter :attribution
  filter :created_at

  index do
    selectable_column
    id_column

    column :image do |pic|
      link_to(image_tag(pic.image.url(:thumb)), admin_pic_path(pic))
    end

    column :stream
    column :caption

    column 'Votes',     :vote_count
    column 'Upvotes',   :upvote_count
    column 'Downvotes', :downvote_count

    column :attribution
    column :user

    column :short_url do |pic|
      link_to pic.short_url(false), pic.short_url
    end
    default_actions
  end


  form do |f|
    f.inputs "Pic details" do
      f.input :stream
      f.input :caption
      f.input :attribution

      f.input :image, as: :file, :hint => f.template.image_tag(f.object.image.url(:display))

      f.input :user
    end
    f.actions
  end


  show do |pic|
    attributes_table do
      row :id
      row :stream
      row :caption

      row :image do |pic|
        link_to(image_tag(pic.image.url(:display)), pic.image.url)
      end

      row :attribution
      row :user

      row :short_url do |pic|
        link_to pic.short_url, pic.short_url
      end

      row :created_at
      row :vote_count
      row :upvote_count
      row :downvote_count

    end
    active_admin_comments
  end
  
end
