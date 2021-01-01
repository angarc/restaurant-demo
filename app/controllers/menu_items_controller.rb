class MenuItemsController < ApplicationController
  def show
    @item = MenuItem.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
end