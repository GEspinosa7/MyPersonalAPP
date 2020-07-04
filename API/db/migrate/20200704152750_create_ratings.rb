class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.date :rating_date
      t.float :rating_value

      t.timestamps
    end
  end
end
