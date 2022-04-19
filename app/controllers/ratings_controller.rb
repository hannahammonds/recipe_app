class RatingsController < ApplicationController 
    before_action :require_user 

    def new
        @rating = Rating.new 
        params [:recipe_id] 
    end

    def create 
        @rating = Rating.new(rating_params)  
        if @rating.save 
            flash[:notice] = "Thank you for rating this recipe!"
            redirect_to recipes_path 
        else 
            render 'new'
        end
    end  
    

    private
        def rating_params 
            params.require(:rating)
        end

end