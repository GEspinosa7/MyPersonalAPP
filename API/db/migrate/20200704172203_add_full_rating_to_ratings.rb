class AddFullRatingToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :full_rating, :string
  end
end
