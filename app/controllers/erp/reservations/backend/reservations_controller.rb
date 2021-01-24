module Erp
  module Reservations
    module Backend
      class ReservationsController < Erp::Backend::BackendController
        before_action :set_reservation, only: [:destroy]
        before_action :set_reservations, only: [:delete_all]

        def index
        end

        def list
          @reservations = Reservation.search(params).paginate(:page => params[:page], :per_page => 20)

          render layout: nil
        end

        # DELETE /reservations/1
        def destroy
          @reservation.destroy
          respond_to do |format|
            format.html { redirect_to erp_reservations.backend_reservations_path, notice: t('.success') }
            format.json {
              render json: {
                'message': t('.success'),
                'type': 'success'
              }
            }
          end
        end

        # DELETE /reservations/delete_all?ids=1,2,3
        def delete_all
          @reservations.destroy_all

          respond_to do |format|
            format.json {
              render json: {
                'message': t('.success'),
                'type': 'success'
              }
            }
          end
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_reservation
            @reservation = Reservation.find(params[:id])
          end

          def set_reservations
            @reservations = Reservation.where(id: params[:ids])
          end

      end
    end
  end
end
