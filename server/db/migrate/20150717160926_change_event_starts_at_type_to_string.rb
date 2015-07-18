class ChangeEventStartsAtTypeToString < ActiveRecord::Migration
  def change
    change_column :events, :starts_at, :string
  end
end
