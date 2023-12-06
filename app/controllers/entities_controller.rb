class EntitiesController < ApplicationController
    before_action :authenticate_user!
    
    def index
      
    end
    
    def show
      
    end
    def total
      # Fetch all transactions from the database
      @entities = Entity.all
    
      # Extract amounts from transactions and calculate the total
      @total = @entities.sum(:amount)
    end
    

  end
  