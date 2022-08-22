class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.references :show, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.boolean :validated, default: false

      t.timestamps
    end
  end
end
