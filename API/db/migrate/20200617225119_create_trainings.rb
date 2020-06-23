class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :kind
      t.string :division
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end
end
