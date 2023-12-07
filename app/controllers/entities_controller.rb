class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
    @group = Group.find(params[:group_id])
    @user = @group.author
  end

  def create
    @entity = Entity.create(entity_params)
    @entity.author = current_user
    if @entity.save
      flash[:success] = 'Transaction created succefully'
      redirect_to user_group_path(@entity.author, @entity.group)
    else
      flash[:error] = 'Something went wrong when create transaction'
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end