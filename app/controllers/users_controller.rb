class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    
    def new
        @user = User.new
    end

    def create
        # Pass parameters to a new User object
        @user = User.new(user_params)

        if @user.save
            # If user is successfully saved redirect to user show page
            session[:user_id] = @user.id
            redirect_to dashboard_path
        else
            # If the user could not be saved, display errors
            flash[:errors] = @user.errors.full_messages
            redirect_to signup_path
        end
    end

    def user_params
        return params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
