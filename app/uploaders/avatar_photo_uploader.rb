# encoding: utf-8

class AvatarPhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  cloudinary_transformation :transformation =>[
    {:width => 150, :height => 150, :crop => :thumb, :gravity => :north, :convert => 'jpg'}
  ]

  def public_id
    key_1 = 'avatar'
    key_2 = rand(1000..9999)
    key_3 = DateTime.now

    part_1 = Digest::SHA1.hexdigest(key_2.to_s)
    part_2 = Digest::SHA1.hexdigest(key_3.to_s)

    public_key = "#{key_1.to_s}_#{part_1.to_s}_#{part_2.to_s}"

    return public_key
  end

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  #def store_dir
  #  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
