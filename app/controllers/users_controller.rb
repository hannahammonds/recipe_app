class UsersController < ApplicationController 
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, :require_same_user, only: [:edit, :update, :destroy] 

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
        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated."
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy 
        @user.destroy 
        session[:user_id] = nil if @user == helpers.current_user
        flash[:notice] = "Account and all information related to your account has been successfully deleted!" 
        redirect_to root_path 
    end

    private
        def user_params 
            params.require(:user).permit(:username, :email, :password) 
        end

        def set_user 
            @user = User.find(params[:id])
        end

        
        
end



