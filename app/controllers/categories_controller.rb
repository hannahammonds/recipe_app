class CategoriesController < ApplicationController 
    before_action :require_admin, except: [:show, :index, :edit] 

    def index 
        @categories = Category.all
    end

    def show 
        @category = Category.find(params[:id]) 
    end

    def new 
        @category = Category.new 
    end 

    def edit 

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

    def require_admin 
        if !(helpers.logged_in? && helpers.current_user.admin?)
            flash[:alert] = "Only admins can perform this action!"
            redirect_to categories_path 
        end
    end

end