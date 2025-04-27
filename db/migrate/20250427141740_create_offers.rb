class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :hotel_name
      t.text :description
      t.float :price
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.string :photo_url
      t.string :date
      t.integer :bed

      t.timestamps
    end
  end
end
