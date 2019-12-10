class RemoveRatingsCountFromSubjects < ActiveRecord::Migration[6.0]
  def change

    remove_column :subjects, :ratings_count, :integer

    remove_column :subjects, :overall_rating, :integer
  end
end
