class RemovePriceFromTrainers < ActiveRecord::Migration[6.0]
  def change
    remove_column :trainers, :price, :float
  end
end
