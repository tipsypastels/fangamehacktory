class AddOverallRatingToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :overall_rating, :integer
  end
end
