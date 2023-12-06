class GroupsController < ApplicationController
    before_action :authenticate_user!

    def index
        @groups= Group.all
    end
    def show 
    end

    def transactions
        @category = Category.find(params[:id]) # Fetch the category
        @transactions = @category.transactions # Fetch transactions for the category
        # Additional logic as needed
      end
end
