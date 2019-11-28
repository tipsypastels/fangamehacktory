class RemoveTypeFromSubjects < ActiveRecord::Migration[6.0]
  def change

    remove_column :subjects, :type, :string
  end
end
