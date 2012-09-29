module QuotesHelper
	def categories
		if controller.controller_name == 'quotes'
			@category = Section.find(:all)
			render :partial => 'modules/categories', category: @category
		end
	end
end
