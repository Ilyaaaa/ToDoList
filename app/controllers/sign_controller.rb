class SignController < ApplicationController
    def sign_in
        session_exsists_check
        @user = User.new
    end

    def authorise
        @errors = Array.new

        begin
            @user = User.find_by email: user_params[:email]

            if @user == nil
                @errors.push("Such user does not exists")
            elsif @user.pass != user_params[:pass]
                @errors.push("Invalid password")
            else
                session[:user_id] = @user.id
            end
        end
    end

    def sign_up
        session_exsists_check
        @user = User.new
    end

    def log_out
        session[:user_id] = nil
        redirect_to sign_in_path
    end
    

    def create
        @user = User.new(user_params)

        @errors = Array.new
        begin
            if !@user.save
                @user.errors.full_messages.each do |msg|
                    @errors.push(msg)
                end
            end    
        rescue ActiveRecord::RecordNotUnique => exception
            @errors.push("Such user already exist")
        end
        
    end

    def confirm
        session_exsists_check
    end

    private def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :pass)
    end

    private def session_exsists_check
        if session[:user_id] != nil
            redirect_to ''
        end
    end
    
end
