class DropTableChecklists < ActiveRecord::Migration[6.0]
  def change
    drop_table :checklists
  end
end
