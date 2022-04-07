class CategoriesController < ApplicationController 
    
    def index 
        @categories = Category.all
    end

    def show 
        @category = Category.find(params[:id]) 
    end

    def new 
        @category = Category.new 
    end 

    def create 
        @category = Category.new(category_params)
        if @category.save 
            flash[:notice] = "Category creation was successful!" 
            redirect_to @category 
        else
            flash[:alert] = "Category was not created successfully."
            render 'new'
        end
    end

    private 
    def category_params 
        params.require(:category).permit(:name) 
    end

end