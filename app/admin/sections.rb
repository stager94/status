ActiveAdmin.register Section do
  index do
    id_column
    column :title
    default_actions
  end

  	form do |f|
    	f.inputs "Details" do
    	  f.input :title
    	end
    	f.buttons
    end   
end
