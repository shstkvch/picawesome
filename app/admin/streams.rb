ActiveAdmin.register Stream do
  filter :slug
  filter :nsfw

  index do
    selectable_column
    id_column
    column          :slug
    column 'NSFW',  :nsfw
    column          :upvote_copy
    column          :downvote_copy
    column 'Color', :background_color

    column          :created_at
    default_actions
  end

  form do |f|
    f.inputs 'Stream details' do
      f.input :slug
      f.input :nsfw,             label: 'NSFW'

      f.input :upvote_copy
      f.input :downvote_copy
      f.input :background_color, label: 'Color'

    end
    f.actions
  end
end
