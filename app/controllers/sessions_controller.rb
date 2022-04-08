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
        flash[:alert] = "Logged Out" 
        redirect_to login_path 
    end
end

