class EntitiesController < ApplicationController
  before_action :authenticate_user!

  # Other actions...

  def show 
    @user = current_user
    @entity = Entity.find(params[:id])
    @group = @entity.group # Assuming Entity has a 'belongs_to :group' association
  end
  

  def new
     @group = Group.find(params[:group_id])
    @entity = Entity.new
  end

  def create
    @entity = Entity.create(entity_params)
    @entity.author= current_user
  
    if @entity.save
      flash[:success] = 'Transaction created successfully'
      redirect_to group_path(@entity.group_id)
    else
      flash[:notice] = @entity.errors.full_messages.join(", ")
      render :new
    end
  end
  
  

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
