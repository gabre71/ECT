class Ability
  include CanCan::Ability

	# Roles 
	# :admin
	# :moderator 
	# :adminisztrator 
	# :common
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
    	can :read, :all
    	can :update, TimeSheet do |time_sheet|
    		time_sheet.try.(:user) == user
	    can :update, TimeSheet if [:moderator, :adminisztrator].include?(user.role)
	  	end
			
      if user.has_role? :moderator
      	can :manage, [TimeFrame,WorkSite,WorkType,PlannedWorkTime]  
      end
    end
  end
end
