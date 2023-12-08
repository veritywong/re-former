class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to new_user_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @user = User.find(params[:id])
      if @user
        render :edit
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        # handle successful update, maybe redirect to show page or another page
        redirect_to user_path(@user), notice: 'User was successfully updated.'
      else
        # handle validation errors, re-render the edit form
        render :edit
      end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
        #params.permit(:username, :email, :password)
    end
end