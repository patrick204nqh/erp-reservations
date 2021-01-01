class CreateErpReservationsReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_reservations_reservations do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.date :resdate
      t.string :restime
      t.integer :numperson
      t.text :note

      t.timestamps
    end
  end
end
