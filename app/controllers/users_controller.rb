class UsersController < ApplicationController 
    before_action :set_user, only: [:show, :edit, :update]
    before_action :require_user, only: [:edit, :update] 
    

    def index 
        @users = User.all
    end

    def show 
        
    end

    def new 
        @user = User.new 
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            flash[:notice] = "Welcome #{@user.username} to Seasonal Plate, you have successfully signed up!"
            redirect_to recipes_path 
        else
            render 'new' 
        end
    end

    def edit 
        
    end

    def update 

    end

    private
        def user_params 
            params.require(:user).permit(:username, :email, :password) 
        end

        def set_user 
            @user = User.find(params[:id])
        end
end


