ActiveAdmin.register User do
  index do
    id_column
    column :username
    column :email
    column :admin
    column :country
    column :created_at
    column :updated_at
    default_actions
  end

  	form do |f|
    	f.inputs "Details" do
    	  f.input :username
    	  f.input :email
          f.input :country,:priority_countries => ['UA', 'RU']
        f.input :admin
    	  f.input :avatar, :as => :file
    	end
    	f.buttons
    end  
end
