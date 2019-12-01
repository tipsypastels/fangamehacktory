class AddPromotionStatusToSubject < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :promotion_status, :integer, default: 0
    remove_column :subjects, :pinned
  end
end
