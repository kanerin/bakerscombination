class AddUserIdToBakerscombinations < ActiveRecord::Migration[6.1]
  def change
    add_column :bakerscombinations, :ingredient_1_name, :text
    add_column :bakerscombinations, :ingredient_2, :float
    add_column :bakerscombinations, :ingredient_2_name, :text
    add_column :bakerscombinations, :ingredient_3, :float
    add_column :bakerscombinations, :ingredient_3_name, :text
    add_column :bakerscombinations, :ingredient_4, :float
    add_column :bakerscombinations, :ingredient_4_name, :text
    add_column :bakerscombinations, :ingredient_5, :float
    add_column :bakerscombinations, :ingredient_5_name, :text
    add_column :bakerscombinations, :ingredient_6, :float
    add_column :bakerscombinations, :ingredient_6_name, :text
    add_column :bakerscombinations, :ingredient_7, :float
    add_column :bakerscombinations, :ingredient_7_name, :text


    add_column :bakerscombinations, :microwave_manufacturer, :text
    add_column :bakerscombinations, :microwave_number, :text
    add_column :bakerscombinations, :bakery_manufacturer, :text
    add_column :bakerscombinations, :bakery_number, :text

    add_column :bakerscombinations, :user_id, :integer
    
  end
end
