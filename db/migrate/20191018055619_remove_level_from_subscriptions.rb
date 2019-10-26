class RemoveLevelFromSubscriptions < ActiveRecord::Migration[6.0]
  def change

    remove_column :subscriptions, :level, :integer
  end
end
