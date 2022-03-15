class RecipesController < ApplicationController
    def show
        @recipe = Recipe.find(params[:id])
    end

    def index 
        @recipes = Recipe.all 
    end

    def new
        @recipe = Recipe.new 
    end

    def create 
        @recipe = Recipe.new(params.require(:recipe), permit(:name, :ingredients, :instructions))
        if @recipe.save 
            flash[:notice] = "Recipe saved successfully!"
            redirect_to @recipe
        else 
            render 'new'
        end
    
    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update 
        @recipe = Recipe.find(params[:id])
        if @book.update(params.require(:recipe).permit(:name, :ingredients, :instructions))
            flash[:message] = "Update successful!"
            redirect_to @recipe 
        else
            render 'edit'
    end

    def destroy
        @book = Book.find(params[:id])
        flash[:message] = "#{@recipe.name} was deleted successfully!"
        @recipe.destroy
        redirect_to books_path 
    end

end
