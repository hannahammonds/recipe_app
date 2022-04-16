class ApplicationController < ActionController::Base
  def require_user 
    if !helpers.logged_in?
        flash[:notice] = "You must be logged in to complete this action."
        redirect_to login_path
    end
  end
 
  def require_same_user 
    if helpers.current_user != @user && !helpers.current_user.admin?
      flash[:alert] = "You can only edit information from your own account."
      redirect_to helpers.current_user 
    end
  end

  def rating_average
    recipe.find(recipe_id)
    #find any rating for the recipe_id
    #put them in an array
    #find the sum of all numbers in array
    #divde sum by number of items in array
    #return float
    #array.sum() / array.size
  end

end
