class KindsController < ApplicationController 
    before_action :require_admin, except: [:show, :index] 

    def index 
        @kinds = Kind.all 
    end

    def show 
        @kind = Kind.find(params[:id])
    end

    def new 
        @kind = Kind.new;
    end

    def create 
        @kind = Kind.new(kind_params)
        if @kind.save 
            flash[:notice] = "Recipe type was created successfully!" 
            redirect_to @kind 
        else
            flash[:alert] = "Recipe type was not created successfully!"
            render 'new'
        end
    end

    private 
    def kind_params 
        params.require(:kind).permit(:name)
    end

    def require_admin 
        if !(helpers.logged_in? && helpers.current_user.admin?)
            flash[:alert] = "Only admins can perform this action." 
            redirect_to kinds_path 
        end
    end

end