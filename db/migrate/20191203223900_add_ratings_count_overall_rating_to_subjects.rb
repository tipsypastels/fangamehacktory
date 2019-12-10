class AddRatingsCountOverallRatingToSubjects < ActiveRecord::Migration[6.0]
  def self.up
    add_column :subjects, :ratings_count, :integer, null: false, default: 0
    add_column :subjects, :overall_rating, :integer, null: false, default: 0
  end

  def self.down
    remove_column :subjects, :ratings_count
    remove_column :subjects, :overall_rating
  end
end
