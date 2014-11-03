class ReaderController < ApplicationController

  def show
    if request.params[:_pjax] == '#item'
      @item = Item.find params[:item_id]
      render partial: 'item', locals: {item: @item}
    else
      if params[:query]
        @items = Item.fulltext_search(params[:query])
      else
        if params[:channel_id]
          @channel = Channel.find(params[:channel_id])
          @items = @channel.items
        else
          @items = Item.all
        end
      end
      @channels = Channel.all
      @items = @items.order(id: :desc).page(params[:page]).per 20
      @item = params[:item_id] ? @items.find(params[:item_id]) : @items.first
    end
    @item.try :update!, unread: false
  end

end
