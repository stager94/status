class UsersController < ApplicationController
	before_filter :get_profile, :only => [:show, :destroy, :edit, :update]

	def show
		add_breadcrumb t('breadcrumbs.profile'), user_path(@profile)	
	end

	def edit
		add_breadcrumb t('breadcrumbs.profile_edit'), user_path(@profile)	
	end

	def get_profile
		@profile = User.find(params[:id])
	end

	def update
		@profile.update_attributes(params[:user])
		redirect_to user_path(@profile)
	end

	def delete_avatar
		@profile.avatar.clear
		@profile.save
		redirect_to user_path(@profile)
	end

	def index
		@users = User.find(:all)
	end
end
