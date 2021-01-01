module Admin
  class MenuItemsController < BaseController
    before_action :set_menu_item, only: [:edit, :update, :show, :destroy]

    def index
      @menu_item_category = MenuItemCategory.find(params[:menu_item_category_id])
      @items = MenuItem.all
    end

    def new
      @menu_item_category = MenuItemCategory.find(params[:menu_item_category_id])
      @item = MenuItem.new
    end

    def create
      @menu_item_category = MenuItemCategory.find(params[:menu_item_category_id])
      @item = MenuItem.new menu_item_params
      @item.menu_item_category = @menu_item_category

      if @item.save
        flash[:success] = "Successfully saved menu item"
        redirect_to admin_menu_item_category_menu_item_path(@menu_item_category, @item)
      else
        flash[:danger] = @item.errors.full_messages.to_sentence
        render :new
      end
    end
    
    def edit
      @item = MenuItem.find(params[:id])
    end

    def update
      @item = MenuItem.find(params[:id])

      if @item.update menu_item_params
        flash[:success] = 'Successfully updated menu item'
        redirect_to admin_menu_item_category_menu_item_path(@menu_item_category, @item)
      else
        flash[:danger] = @item.errors.full_messages.to_sentence
        render :edit
      end
    end

    def show
      @item = MenuItem.find(params[:id])
    end

    private
      def menu_item_params
        params.require(:menu_item).permit(:name,
                                          :description,
                                          :price,
                                          :ingredients,
                                          :extra_info,
                                          :show_nutritional_facts,
                                          :calories,
                                          :carbs,
                                          :fat,
                                          :sodium,
                                          :cholesterol,
                                          :featured_image)
      end

      def set_menu_item 
        @menu_item_category = MenuItemCategory.find(params[:menu_item_category_id])
        @menu_item = @menu_item_category.menu_items.find(params[:id])
      end
  end
end