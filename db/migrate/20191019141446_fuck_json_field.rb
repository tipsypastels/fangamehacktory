class FuckJsonField < ActiveRecord::Migration[6.0]
  def change
    change_column :topics, :fields, :text, default: '{}'
  end
end
