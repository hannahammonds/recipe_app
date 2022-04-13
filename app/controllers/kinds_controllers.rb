class KindsController < ApplicationController 
    
    def index 

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

end