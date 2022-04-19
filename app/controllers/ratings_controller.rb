class RatingsController < ApplicationController 
    before_action :require_user 

    def new
        @rating = Rating.new 
        params[:recipe_id] 
    end

    def create 
        @rating = Rating.new  
        
        if @rating.save 
            flash[:notice] = "Thank you for rating this recipe!"
            redirect_to recipes_path 
        else 
            render 'new'
        end
    end 

end