class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    
    user ||= User.new # guest user (not logged in)
    
    # Find out max of role_type of roles assigned to a user.
    # Reference
    highest_role = user.roles.order("role_type DESC").first

    if highest_role.nil?
        highest_role_type = 3
    else
        highest_role_type = highest_role.role_type
    end 
    
    case highest_role_type
    when 1 then admin
    when 2 then manager
    else user
    end
    
  end
  
  # Reference: https://github.com/ryanb/cancan/wiki/Action-Aliases
  # CanCan RESTful action aliases:
  # alias_action :index, :show, :to => :read
  # alias_action :new, :to => :create
  # alias_action :edit, :to => :update
  
  def admin
    # Rails.logger.info "admin method invoked"
    # :manage represents any action and :all represents any object.
     can :manage, :all
    # can :manage, User
  end
  
  def manager
    # Rails.logger.info "manager method invoked"
    user
    can :update, User
    can [:read, :assign], Role 
  end
  
  def user
    Rails.logger.info "user method invoked"
    can :read, User
  end
end
