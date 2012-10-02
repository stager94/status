ActiveAdmin.register Quote do
  index do
    id_column
    column :author
    column :content
    column :user
    default_actions
  end           
end
