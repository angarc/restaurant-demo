class PagesController < ApplicationController
  def home
    @menu_item_categories = MenuItemCategory.all.includes(:menu_items)
  end
end
