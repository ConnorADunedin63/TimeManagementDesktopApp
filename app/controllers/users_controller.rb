class UsersController < ApplicationController
    def welcome

    end
    
    def new
        @user = User.new
    end

    def create
        # Pass parameters to a new User object
        @user = User.new(user_params)

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

    def authenticate
        # Both the email and password should be present
        unless params[:email].present? && params[:password].present?
            if !params[:email].present?
                flash[:blank_email] = "Email cannot be blank!"
            end
    
            if !params[:password].present?
                flash[:blank_password] = "Password cannot be blank!"
            end
            redirect_to users_login_path
            return
        end

        @user = User.find_by(email: params[:email])

        if @user.present?
            # If the user with the email is present, try authenticating with password
            if @user.authenticate(params[:password]) != false
                # Redirect to the user's show page
                redirect_to "/users/#{@user.id}"
                return
            end
        end
        # Incorrect email or password
        flash[:incorrect] = "Incorrect email or password"
        redirect_to users_login_path
    end

    def show

    end

    def user_params
        return params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
