class UsersController < ApplicationController
	before_filter :get_profile, :only => [:show, :destroy, :edit, :update, :delete_avatar]

	def show
		add_breadcrumb t('breadcrumbs.profile'), user_path(@profile)	
	end

	def edit
		if !current_user.nil? && current_user.admin == true || current_user == @profile
			add_breadcrumb t('breadcrumbs.profile_edit'), user_path(@profile)	
		else
			redirect_to user_path(@profile)
		end
	end

	def get_profile
		@profile = User.find(params[:id])
	end

	def update
		if !current_user.nil? && current_user.admin == true || current_user == @profile
			@profile.update_attributes(params[:user])
			redirect_to user_path(@profile)
		end
	end

	def delete_avatar
		if !current_user.nil? && current_user.admin == true || current_user == @profile
			@profile.avatar.clear
			@profile.save
		end
			redirect_to user_path(@profile)
	end

	def index
		@users = User.list.page(params[:page]).per(50).order('created_at DESC')
		add_breadcrumb t('breadcrumbs.users'), users_path
	end

	def online
		@users = User.online.page(params[:page]).per(50).order('created_at DESC')
		add_breadcrumb t('breadcrumbs.users_online'), users_path
	end
end
