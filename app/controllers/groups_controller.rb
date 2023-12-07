class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :calculate_group_totals, only: [:index, :show]

  def index
    @groups = Group.all.includes(:entities)
  end

  def show
    @group = Group.find(params[:id])
    @entities = @group.entities.order(created_at: :desc)
  end

  def create
    @group = Group.new(group_params)
  
    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new
    end
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def calculate_group_totals
    @group_totals = {}
    groups_with_entities = Group.includes(:entities)

    groups_with_entities.each do |group|
      @group_totals[group.id] = group.entities.sum(:amount)
    end
  end
end
