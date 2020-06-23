class AddClientAndTrainerToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_reference :trainings, :client, null: false, foreign_key: true
    add_reference :trainings, :trainer, null: false, foreign_key: true
  end
end
