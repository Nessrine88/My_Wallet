class UsersController < ApplicationController
    def index
    end 
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to root_path, notice: 'Signup successful!'
        else
          render :new
        end 
    end
end
