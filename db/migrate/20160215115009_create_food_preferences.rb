class CreateFoodPreferences < ActiveRecord::Migration
  def change
    create_table :food_preferences do |t|
      t.references :food, null: false
      t.references :squirrel, null: false

      t.timestamps null: false
    end
  end
end
