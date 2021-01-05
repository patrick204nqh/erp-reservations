module Erp::Reservations
  class Reservation < ApplicationRecord
    before_create :generate_code

    validates :name, :phone, :email, :resdate, :restime, :numperson, presence: true

    def generate_code
      size = 4
			charset = %w{0 1 2 3 4 6 7 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z}
			self.code = Time.now.strftime("%Y%m").last(4) + (0...size).map{ charset.to_a[rand(charset.size)] }.join
    end

  end
end
