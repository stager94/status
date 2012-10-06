ActiveAdmin.register User do
  index do
    id_column
    column :username
    column :email
    column :first_name
    column :last_name
    column :sex
    column :country
    column :vk
    column :online
    column :admin
    column :last_requested_at
    default_actions
  end

  	form do |f|
    	
        f.inputs "Details" do
    	  f.input :username
    	  f.input :email
        f.input :vk
        f.input :country,:priority_countries => ['UA', 'RU']
        f.input :sex, :as => 'select', :collection => [["Female", 0], ["Male", 1]]
        f.input :admin
    	  f.input :avatar, :as => :file
    	end
    	f.buttons
    end  
end