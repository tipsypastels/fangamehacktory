class AllowArbitraryFakemonTypes < ActiveRecord::Migration[6.0]
  def change
    change_column :fakemons, :type1, :string
    change_column :fakemons, :type2, :string
  end
end
