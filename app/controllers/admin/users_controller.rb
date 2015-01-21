module Admin
  class UsersController < ApplicationController
    before_filter :authorize!

    def index
      @users = User.all.page(params[:page]).per(10)
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_update_params)
        flash[:notice] = "User Successfully Updated"
        redirect_to admin_user_path(@user)
      else
        flash[:notice] = "User Not Updated"
        render "edit"
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "User #{@user.email} deleted"
      redirect_to admin_users_path
    end

    protected

    def user_update_params
      params.require(:user).permit(:email, :first_name, :last_name)
    end
  end
end
