class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.text :ingredients
      t.text :extra_info

      t.boolean :show_nutritional_facts, default: false
      t.integer :calories
      t.integer :carbs
      t.integer :protein
      t.integer :fat
      t.integer :sodium
      t.integer :cholesterol
      t.timestamps
    end
  end
end
