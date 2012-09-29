module QuoteHelper
	def categories
		if controller.controller_name == 'quotes'
			@category = Category.find(:all)
			render :partial => 'modules/categories', category: @category
		end
	end
end
