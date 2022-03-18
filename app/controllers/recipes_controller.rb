class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :destroy, :update] 
    
    def show
    end

    def index 
        @recipes = Recipe.all 
    end

    def new
        @recipe = Recipe.new 
    end

    def create 
        @recipe = Recipe.new(recipe_params)
        if @recipe.save 
            flash[:notice] = "Recipe saved successfully!"
            redirect_to @recipe
        else 
            render 'new'
        end
    end 
    
    def edit
    end

    def update 
        if @recipe.update(recipe_params)
            flash[:message] = "Update successful!"
            redirect_to @recipe 
        else
            render 'edit'
        end
    end

    def destroy
        flash[:message] = "#{@recipe.name} was deleted successfully!"
        @recipe.destroy
        redirect_to recipes_path 
    end

end 

private 

def set_recipe 
    @recipe = Recipe.find(params[:id])
end

def recipe_params 
    params.require(:recipe).permit(:name, :ingredients, :instructions)
end
