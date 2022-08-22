class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :company
      t.string :location_center
      t.integer :location_radius
      t.float :price

      t.timestamps
    end
  end
end
