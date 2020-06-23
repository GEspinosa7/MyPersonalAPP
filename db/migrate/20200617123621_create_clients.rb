class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :lastname
      t.date :birth_date
      t.string :weight
      t.string :height
      t.string :goal
      t.string :time_active
      t.string :availability

      t.timestamps
    end
  end
end
