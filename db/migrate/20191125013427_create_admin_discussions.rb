class CreateAdminDiscussions < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_discussions do |t|

      t.timestamps
    end
  end
end
