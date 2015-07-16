class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :logo
      t.integer :ranking, null: false, default: 0
      t.string :location
      t.integer :league_id, null: false

      t.timestamps null: false
    end
  end
end
