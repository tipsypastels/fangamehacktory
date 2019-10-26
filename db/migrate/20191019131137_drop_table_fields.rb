class DropTableFields < ActiveRecord::Migration[6.0]
  def change
    drop_table :fields
  end
end
