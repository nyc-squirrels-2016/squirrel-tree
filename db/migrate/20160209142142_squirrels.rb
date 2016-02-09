class Squirrels < ActiveRecord::Migration
  def change
    create_table :squirrels do |t|
      t.string :name, null: false
      t.string :color, null: false

      t.timestamps null: false
    end
  end
end
