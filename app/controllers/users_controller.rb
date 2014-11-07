require 'digest/sha1'

class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!, :except => [:index]

  def index
    @user = params[:user_name]
    @user = User.where(user_name: @user).first
  end

  def show
    @user = User.find current_user.id
  end

  def new
  end

  def edit
    @page = params[:page]

    user_edit_pages(@page)
    @user = User.find current_user.id

    @user_photo = UserPhoto.where(user_id: @user).all

  end

  def update
    @user = User.find(params[:id])
    @page = params[:user][:page]

    if @page.eql? 'biography'

      if @user.update_attributes(biography_params)
        redirect_to users_edit_path(:page => 'dashboard'), :notice => "#{@page.capitalize} updated!"
      else
        redirect_to users_edit_path(:page => @page), :active_record => error_list(@user)
      end

    elsif @page.eql? 'photo_avatar'
      @user.skip_user_name_validation = true

      if @user.update_attributes(photo_avatar_params)
        current_avatar = cloudinary_image_id(current_user.avatar)

        if @user.avatar.present?
          Cloudinary::Api.delete_resources(current_avatar)
        end
        redirect_to users_edit_path(:page => 'dashboard'), :notice => "#{@page.capitalize} updated!"
      else
        redirect_to users_edit_path(:page => @page), :active_record => error_list(@user)
      end

    elsif @page.eql? 'photo_background'
      @user.skip_user_name_validation = true

      if @user.update_attributes(photo_background_params)
        #Copy to User_photo
        copy = UserPhoto.create!(
            user_id: current_user.id,
            large: @user.background_photo.to_s,
            small: @user.background_photo_url(:thumbnail)
        )

        if copy.save
          redirect_to users_edit_path(:page => 'dashboard'), :notice => "#{@page.capitalize} updated!"
        end
      else
        redirect_to users_edit_path(:page => @page), :notice => params[:user]
      end

    else
      redirect_to :back, :alert => "Invalid request. That page doe's not exist."
    end
  end

  def delete
  end

  def subregion_options
    render partial: 'layouts/subregion_select'
  end

  private
    def biography_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :headline, :country, :subregion, :work, :education, :interests, :biography)
    end

    def photo_avatar_params
      params.require(:user).permit(:avatar)
    end

    def photo_background_params
      params.require(:user).permit(:background_photo)
    end

end
