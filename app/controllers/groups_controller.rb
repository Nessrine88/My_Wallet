class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :calculate_group_totals, only: [:index, :show]

  def index
    @groups = Group.all.includes(:entities)
  end

  def show
    @user = current_user
    @group = Group.find(params[:id])
    @entities = @group.entities.order(created_at: :desc)
  end
  def new
    @group= Group.new
  end
  
    def create
      @group = Group.create(group_params)
      @group.author = current_user
    if @group.save
   flash[:notice] ='Group was successfully created.'
    else
      flash[:notice] = @group.errors.full_messages.join(", ")
      render 'new'
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
