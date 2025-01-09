class UsersController < ApplicationController
    def index
    end

    def new
      @user = User.new
    end

    def create
      #   @user = User.new(user_params)
      #   if @user.save
      #      # Đăng nhập sau khi đăng ký
      #     redirect_to root_path, notice: "Registration successful!"
      #   else
      #     render :new, alert: "Error creating account."
      #   end

      @user = User.new user_params
      if @user.save
        flash[:notice] = "Register success"
        redirect_to users_path
      else
        flash[:notice] = "Register failed"
        render :new
      end
    end

    private
def user_params
  params.require(:user).permit(:email_address, :password, :password_confirmation)
end
end
