class AddImageToBakerscombinations < ActiveRecord::Migration[6.1]
  def change
    add_column :bakerscombinations, :image, :string
    add_column :bakerscombinations, :ferment1_time_minutes, :int
    add_column :bakerscombinations, :ferment1_time_seconds, :int
    add_column :bakerscombinations, :ferment1_temperature, :int
    add_column :bakerscombinations, :ferment2_time_minutes, :int
    add_column :bakerscombinations, :ferment2_time_seconds, :int
    add_column :bakerscombinations, :ferment2_temperature, :int
    add_column :bakerscombinations, :roasted_time_minutes, :int
    add_column :bakerscombinations, :roasted_time_seconds, :int
    add_column :bakerscombinations, :roasted_temperature, :int
    
  end
end
