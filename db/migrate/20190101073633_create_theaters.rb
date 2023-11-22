class CreateTheaters < ActiveRecord::Migration[6.1]
  def change
    create_table :theaters do |t|
      t.integer :theater_number, null: false
      t.timestamps
    end
  end
end
