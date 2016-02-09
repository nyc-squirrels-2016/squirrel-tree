class Trees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :location, null: false
      t.integer :height, default: 10

      t.timestamps null: false
    end
  end
end
