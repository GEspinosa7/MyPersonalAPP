class AddPriceToTrainers < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :price, :string
  end
end
