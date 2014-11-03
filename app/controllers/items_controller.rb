class ItemsController < ApplicationController
  before_action :set_item, only: [:update]

  def update
    if @item.update(item_params)
      head :ok
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:unread)
  end
  
end
