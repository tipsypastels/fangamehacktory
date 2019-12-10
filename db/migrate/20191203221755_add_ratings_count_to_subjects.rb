class AddRatingsCountToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :ratings_count, :integer, default: 0
    change_column_default :subjects, :overall_rating, 0
  end
end
