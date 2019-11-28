class DefaultCounters < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :posts_count, 0
    change_column_default :users, :topics_count, 0
  end
end
