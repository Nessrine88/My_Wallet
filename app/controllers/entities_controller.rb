class EntitiesController < ApplicationController
    before_action :authenticate_user!

    def index
        @entities= Entity.all
    end
    def show 
    end
end
