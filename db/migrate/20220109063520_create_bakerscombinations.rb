class CreateBakerscombinations < ActiveRecord::Migration[6.1]
  def change
    create_table :bakerscombinations do |t|
      t.text :name
      t.float :ingredient_1

      t.timestamps
    end
  end
end
