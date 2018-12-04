class ListController < ApplicationController
    def index
        if session[:user_id] == nil
            redirect_to sign_in_path
        end
        
    end
end
