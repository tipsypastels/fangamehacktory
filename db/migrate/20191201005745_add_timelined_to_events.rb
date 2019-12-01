class AddTimelinedToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :timelined, :boolean, default: false
  end
end
