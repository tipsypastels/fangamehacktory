class SetDefaultColorBlack < ActiveRecord::Migration[6.0]
  def change
    change_column_default 'topics', 'color', '#1c1c1e'
  end
end
