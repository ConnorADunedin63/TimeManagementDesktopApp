class UsersController < ApplicationController
    def welcome

    end
    
    def new
        @user = User.new
    end

    def create
        # Pass parameters to a new User object
        @user = User.new(user_params)
        puts user_params

        if @user.save
            # If user is successfully saved redirect to user show page
            redirect_to "/users/#{@user.id}"
        else
            # If the user could not be saved, display errors
            render users_new_path
        end
    end

    def login

    end

    def show

    end

    def user_params
        return params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
