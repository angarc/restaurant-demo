class AddMenuItemCategoryToMenuItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :menu_items, :menu_item_category, null: false, foreign_key: true
  end
end
