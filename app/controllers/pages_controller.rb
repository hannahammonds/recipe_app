class PagesController < ApplicationController
    def home
        redirect_to recipes_path if helpers.logged_in? 
    end

    def about
        
    end
end
