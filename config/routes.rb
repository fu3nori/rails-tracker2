Rails.application.routes.draw do
  scope ENV.fetch("RAILS_RELATIVE_URL_ROOT", "/") do
    get "home/index"
    root "home#index"
    get "up" => "rails/health#show", as: :rails_health_check
    get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
    get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  end
end
