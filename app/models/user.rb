class User < ActiveRecord::Base
  attr_accessor :skip_user_name_validation

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable

  has_many :user_photo, dependent: :destroy

  validates_presence_of   :first_name, :last_name, :gender, :birthday
  validates_format_of     :first_name, :last_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates_format_of     :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email
  validates_presence_of   :user_name, on: :update, unless: :skip_user_name_validation
  validates_uniqueness_of :user_name, on: :update, unless: :skip_user_name_validation
  validates_format_of     :user_name, :with => /\A(?=.*[a-z])[a-z\d]+\Z/i, on: :update, unless: :skip_user_name_validation

  mount_uploader :avatar, AvatarPhotoUploader

  mount_uploader :background_photo, BackgroundPhotoUploader

  def is_admin?
    true if self.role? == "Admin"
  end

  def is_user?
    true if self.role? == "User"
  end

  def role?
    self.role
  end

  def promote!
    self.update_attributes(role: 'Admin')
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)

    user = User.where(:provider => auth.provider, :fb_uid => auth.uid).first

    unless user
      user = User.where(:email => auth.info.email).first

      if user.nil?
        user = User.new(provider: auth.provider,
                        fb_uid: auth.uid,
                        first_name: auth.extra.raw_info.first_name,
                        last_name: auth.extra.raw_info.last_name,
                        email: auth.info.email,
                        password: Devise.friendly_token[0,20])

        user.skip_confirmation!
        user.save(:validate => false)
      end
    end

    return user

  end

end


