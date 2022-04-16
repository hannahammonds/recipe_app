class RatingController < ApplicationRecord 
    before_action :require_user

    def new 
        @rating = Rating.new 
    end

    def create 
        @rating = Rating.new(rating_params)
        @rating.user = helpers.current_user && !recipe.user  
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