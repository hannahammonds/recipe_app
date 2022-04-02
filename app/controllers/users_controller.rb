class UsersController < ApplicationController 
    def index 
        @user = User.all
    end

    def show 
        @user = User.find(params[:id])
    end

    def new 
        @user = User.new 
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            flash[:notice] = "Welcome #{@user.username} to Seasonal Plate, you have successfully signed up!"
            redirect_to recipes_path 
        else
            render 'new' 
        end
    end

    def edit 
        @user = User.find(params[:id]) 
    end

    def update 

    end

    private
    def user_params 
        params.require(:user).permit(:username, :email, :password) 
    end
end


