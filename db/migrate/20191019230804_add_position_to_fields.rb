class AddPositionToFields < ActiveRecord::Migration[6.0]
  def change
    add_column :fields, :position, :integer
  end
end
