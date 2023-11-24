class CreateScreens < ActiveRecord::Migration[6.1]
  def change
    create_table :screens do |t|
      t.integer :screen_number, null: false
      t.references :theater, foreign_key: true
      t.timestamps
    end
  end
end
