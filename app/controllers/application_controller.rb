class ApplicationController < ActionController::Base
 def require_user 
    if !helpers.logged_in?
        flash[:notice] = "You must be logged in to complete this action."
        redirect_to login_path
    end
 end

 def require_same_user 
    if helpers.current_user != @recipe.user && !helpers.current_user.admin?
      flash[:notice] = "You can only edit your own recipes."
      redirect_to helpers.current_user 
    end
  end 

end
