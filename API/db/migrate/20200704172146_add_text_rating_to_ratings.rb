class AddTextRatingToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :text_rating, :string
  end
end
