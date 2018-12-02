class SignController < ApplicationController
    def sign_in

    end

    def sign_up
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        @errors = Array.new
        if !@user.save
            @user.errors.full_messages.each do |msg|
                @errors.push(msg)
            end
        end
    end

    def confirm
        
    end

    private def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :pass)
    end
end
