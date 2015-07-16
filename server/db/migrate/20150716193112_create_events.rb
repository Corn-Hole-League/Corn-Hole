class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.integer :league_id, null: false
      t.date :occurs_on, null: false
      t.time :starts_at, null: false

      t.timestamps null: false
    end
  end
end
