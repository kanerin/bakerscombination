class AddIngredient1NameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :ingredient_1, :text
    add_column :users, :ingredient_1_name, :text
    add_column :users, :ingredient_2, :float
    add_column :users, :ingredient_2_name, :text
    add_column :users, :ingredient_3, :float
    add_column :users, :ingredient_3_name, :text
    add_column :users, :ingredient_4, :float
    add_column :users, :ingredient_4_name, :text
    add_column :users, :ingredient_5, :float
    add_column :users, :ingredient_5_name, :text
    add_column :users, :ingredient_6, :float
    add_column :users, :ingredient_6_name, :text
    add_column :users, :ingredient_7, :float
    add_column :users, :ingredient_7_name, :text

    add_column :users, :microwave_manufacturer, :text
    add_column :users, :microwave_number, :text
    add_column :users, :bakery_manufacturer, :text
    add_column :users, :bakery_number, :text

    add_column :users, :ferment1_time_minutes, :int
    add_column :users, :ferment1_time_seconds, :int
    add_column :users, :ferment1_temperature, :int
    add_column :users, :ferment2_time_minutes, :int
    add_column :users, :ferment2_time_seconds, :int
    add_column :users, :ferment2_temperature, :int
    add_column :users, :roasted_time_minutes, :int
    add_column :users, :roasted_time_seconds, :int
    add_column :users, :roasted_temperature, :int
  end
end
