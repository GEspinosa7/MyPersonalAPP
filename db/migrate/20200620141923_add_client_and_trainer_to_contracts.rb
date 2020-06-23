class AddClientAndTrainerToContracts < ActiveRecord::Migration[6.0]
  def change
    add_reference :contracts, :client, null: false, foreign_key: true
    add_reference :contracts, :trainer, null: false, foreign_key: true
  end
end
