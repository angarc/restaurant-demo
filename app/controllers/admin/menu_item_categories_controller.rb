module Admin
  class MenuItemCategoriesController < BaseController
    def index
      @categories = MenuItemCategory.all
    end

    def new
      @menu_item_category = MenuItemCategory.new
    end

    def create
      @menu_item_category = MenuItemCategory.new menu_item_category_params

      if @menu_item_category.save
        flash[:success] = 'Saved menu item category'
        redirect_to admin_menu_item_categories_path
      else
        flash[:danger] = @menu_item_category.errors.full_messages.to_sentence
        render :new
      end
    end

    private
      def menu_item_category_params
        params.require(:menu_item_category).permit(:name)
      end
  end
end