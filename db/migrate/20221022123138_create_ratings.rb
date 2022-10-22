class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.string :img_url
      t.decimal :rating
      t.string :description
      t.string :imdb_id

      t.timestamps
    end
  end
end