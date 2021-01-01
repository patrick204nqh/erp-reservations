module Erp::Reservations
    class ReservationMailer < Erp::ApplicationMailer
        def sending_admin_email_reservation_confirmation(reservation)
            @recipients = ['Karl Patrick <patrick204nqh@gmail.com>']

            @reservation = reservation
            send_email(@recipients.join("; "), "[THCN] -#{Time.current.strftime('%Y%m%d')}- YÊU CẦU ĐẶT BÀN MỚI")
        end

        def sending_customer_email_reservation_confirmation(reservation)
            @reservation = reservation
            send_email(@reservation.email, "#{Time.current.strftime('%Y%m%d')} - XÁC NHẬN ĐẶT BÀN")
        end
    end
end