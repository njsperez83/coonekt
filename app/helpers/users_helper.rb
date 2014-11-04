module UsersHelper

  def user_edit_pages(param)
    page = ['dashboard', 'photo', 'biography', 'contact', 'links']

    unless page.include? param
      redirect_to users_edit_path(:page => 'dashboard')
    end
  end

  def error_list(object)

    if object.errors.any?
      @errors = []
      object.errors.full_messages.each do |msg|
        @errors << msg
      end
    end

    return @errors

  end

  def cloudinary_image_id(image)
    return image.to_s.split('/').last.chomp('.jpg')
  end

  def to_sentence(first_name, last_name, email, birthday)
    first_name = first_name.gsub(/[^a-zA-Z0-9\-]/,'')
    last_name = last_name.gsub(/[^a-zA-Z0-9\-]/,'')
    name = first_name + ' ' + last_name
    full_name = name.gsub(' ', '')
    first_name = first_name.gsub(' ', '')
    birthday = birthday.last(2)
    first_name_birthday = first_name + birthday

    email = last_name + email.split("@").first
    email = email.gsub!(/[^0-9A-Za-z]/, '')

    string = name + ' ' + full_name + ' ' + email + ' ' + first_name_birthday
    string = string.downcase
    string = string.gsub(' ', ', ')

    return string
  end
end
