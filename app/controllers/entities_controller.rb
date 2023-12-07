class EntitiesController < ApplicationController
  before_action :authenticate_user!

  # Other actions...

  def new
   
  end

  def create
    @entity = Entity.create(entity_params)
    @entity.author = current_user
    if @entity.save
      flash[:success] = 'Transaction created succefully'
      redirect_to group_path
    else
      flash[:error] = 'Something went wrong when create transaction'
      render :new
    end
  end
  

  private

  def entity_params
    # params.require(:entity).permit(:name, :amount, :group_id)
  end
  
end
