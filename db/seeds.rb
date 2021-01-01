require 'faker'

Erp::Reservations::Reservation.destroy_all

10.times do
    Erp::Reservations::Reservation.create(
        name: Faker::Name.name,
        phone: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email,
        resdate: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all).strftime("%d/%m/%Y"),
        restime: "#{Faker::Number.within(range: 9..22)}:#{Faker::Number.within(range: 15..50)}",
        numperson: Faker::Number.within(range: 1..10),
        note: Faker::Lorem.paragraph,
    )
end