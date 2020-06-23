class CreateTrainers < ActiveRecord::Migration[6.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :lastname
      t.date :birth_date
      t.string :time_acting
      t.string :qualifications
      t.string :availability
      t.float :price
      t.string :uid

      t.timestamps
    end
  end
end
