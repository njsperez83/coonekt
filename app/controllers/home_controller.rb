class HomeController < ApplicationController
  def index
    ActionMailer::Base.mail(:from => "connect@coonekt.com", :to => "njsperez@icloud.com", :subject => "ZOHO TEST", :body => 'Heeeee').deliver
  end
end
