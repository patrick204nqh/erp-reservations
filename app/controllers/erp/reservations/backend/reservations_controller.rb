module Erp
  module Reservations
    module Backend
      class ReservationsController < Erp::Backend::BackendController
        def index
        end

        def list
          @reservations = Reservation.all.paginate(:page => params[:page], :per_page => 20)

          render layout: nil
        end

      end
    end
  end
end
