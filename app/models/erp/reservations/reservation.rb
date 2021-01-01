module Erp::Reservations
  class Reservation < ApplicationRecord
    validates :name, :phone, :email, :resdate, :restime, :numperson, presence: true
  end
end
