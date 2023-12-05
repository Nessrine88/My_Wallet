class UsersController < ApplicationController
    def index
    end 
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
          # Handle successful signup
          redirect_to root_path, notice: 'Signup successful!'
        else
          # Handle signup failure
          render :new
        end 
    end
end
