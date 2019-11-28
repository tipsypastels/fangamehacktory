class AddIpAddressToViews < ActiveRecord::Migration[6.0]
  def change
    add_column :views, :ip_address, :string
    add_column :views, :country, :string
  end
end
