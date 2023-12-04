class CreateRanks < ActiveRecord::Migration[6.1]
  def change
    create_table :ranks do |t|
      t.references :movie, null: false, foreign_key: true
      t.date :rank_date, null: false
      t.integer :reservation_count
      t.timestamps
    end
  end
end
