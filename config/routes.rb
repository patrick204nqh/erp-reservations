Erp::Reservations::Engine.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    namespace :backend, module: "backend", path: "backend/reservations" do
      resources :reservations do
        collection do
          post 'list'
          get 'reservation_details'
					delete 'delete_all'
        end
      end
    end
  end
end