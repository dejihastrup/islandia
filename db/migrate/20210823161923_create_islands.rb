class CreateIslands < ActiveRecord::Migration[6.0]
  def change
    create_table :islands do |t|
      t.string :name
      t.integer :price
      t.string :location
      t.integer :squarekm
      t.integer :number_of_villas
      t.integer :guests
      t.boolean :wifi
      t.boolean :helicopter
      t.boolean :golf_course
      t.boolean :private_chef
      t.integer :butlers
      t.integer :yachts
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
