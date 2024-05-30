ActiveAdmin.register Page do
  form do |f|
    f.semantic_errors

    inputs do
      f.input :user
      f.input :title
      f.input :summary
      f.input :content
      f.input :tags_string, label: 'Tags',
        input_html: { value: f.object.tags_string_for_form }
      f.input :published
    end

    f.actions
  end

  permit_params :user_id,
                :title,
                :summary,
                :content,
                :tags_string,
                :published

  show do
    attributes_table do
      row :user
      row :title
      row :slug
      row :summary
      row :content
      row('Tags') { |p| p.tags_string_for_form }
      row :published
    end
  end
end
