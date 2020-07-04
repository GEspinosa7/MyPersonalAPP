class AddClientAndTrainerToRatings < ActiveRecord::Migration[6.0]
  def change
    add_reference :ratings, :client, null: false, foreign_key: true
    add_reference :ratings, :trainer, null: false, foreign_key: true
  end
end
