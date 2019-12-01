class RemovePromotionStatusFromSubjects < ActiveRecord::Migration[6.0]
  def change

    remove_column :subjects, :promotion_status, :integer
  end
end
