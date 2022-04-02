class SessionsController < ApplicationController
    
    def new 

    end

    def create 
        user = User.find_by(email: params[:sessions][:email])
        if user && user.authenticate(params[:sessions][:password])
            session[:user_id] = user.id 
            flash[:notice] = "Logged in successfully!"
            redirect_to user
        else 
            flash[:notice] = "Unsuccessful Login"
            render 'new'
        end
    end

    def destroy 
        session[:user_id] = nil
        flash[:notice] = "Logged Out" 
        redirect_to root_path 
    end
end