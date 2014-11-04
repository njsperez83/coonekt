class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_user?
      cannot :access, :rails_admin
    else
      can :manage, :all
    end
  end
end
