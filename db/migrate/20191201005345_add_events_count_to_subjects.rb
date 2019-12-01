class AddEventsCountToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :events_count, :integer, default: 0
    add_column :subjects, :timelined_events_count, :integer, default: 0
  end
end
