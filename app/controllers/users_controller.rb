class UsersController < ApplicationController
    def index
    end 
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to new_user_session_path, notice: 'Signed up successfully. Please sign in.'
        else
          render :new
        end
    end
end
