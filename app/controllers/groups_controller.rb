class GroupsController < ApplicationController
    before_action :authenticate_user!

    def index
        @groups= Group.all
        @groups = Group.all.includes(:entities)
        @group_totals = {}
        @groups.each do |group|
        @group_totals[group.id] = group.entities.sum(:amount)
        end
    end
    def show
        @group = Group.find(params[:id])
        @entities = @group.entities
        @entities = @group.entities.order(created_at: :desc)
      end
    
end
