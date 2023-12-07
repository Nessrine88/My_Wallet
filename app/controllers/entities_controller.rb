class EntitiesController < ApplicationController
  before_action :authenticate_user!

  # Other actions...

  def show 
    @user = current_user
    @group = Group.find(params[:id])
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author = current_user

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
