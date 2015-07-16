class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :team_id, null: false
      t.integer :event_id, null: false
      t.integer :score

      t.timestamps null: false
    end
  end
end
