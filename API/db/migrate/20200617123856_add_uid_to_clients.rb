class AddUidToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :uid, :string
  end
end
