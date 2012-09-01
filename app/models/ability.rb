class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
       can :manage, :all
    elsif user.reviewer?
       can :manage, Rate
       can :read, Presentation
       can :read , Course
    elsif user.presenter?
      can [:create, :read], Presentation
    end
  end
end
