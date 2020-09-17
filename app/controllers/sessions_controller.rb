class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
  end

  def create
    # Both the email and password should be present
    unless params[:email].present? && params[:password].present?
      if !params[:email].present?
          flash[:blank_email] = "Email cannot be blank!"
      end

      if !params[:password].present?
          flash[:blank_password] = "Password cannot be blank!"
      end
      redirect_to login_path
      return
  end

    @user = User.find_by(email: params[:email])

    if @user.present?
        # If the user with the email is present, try authenticating with password
        if @user.authenticate(params[:password]) != false
            session[:user_id] = @user.id
            # Redirect to the user's show page
            redirect_to dashboard_path
            return
        end
    end
    # Incorrect email or password
    flash[:incorrect] = "Incorrect email or password"
    redirect_to login_path
  end

  def welcome
  end

  def dashboard
  end

  def logout
    session[:user_id] = nil
    redirect_to welcome_path
  end
end
