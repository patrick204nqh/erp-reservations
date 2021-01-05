class AddCodeToErpReservationsReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_reservations_reservations, :code, :string
  end
end
