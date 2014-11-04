class UserPhotosController < ApplicationController
  include UsersHelper

  def update
    image_id = params[:id]

    @user_photo = UserPhoto.where(id: image_id, user_id: current_user.id).first
    if @user_photo.present?

      @user = User.find @user_photo.user_id
      #Allow uploads if empty User name
      @user.skip_user_name_validation = true

      if @user.update_attributes(background_photo: @user_photo.large)

        Cloudinary::Uploader.rename(cloudinary_image_id(@user_photo.large), cloudinary_image_id(@user.background_photo))
        @user_photo.update_attributes(large: @user.background_photo.to_s)

        redirect_to users_edit_path(:page => 'photo'), :notice => 'Changed background photo'
      end
    else
      redirect_to :back
    end
  end

end
