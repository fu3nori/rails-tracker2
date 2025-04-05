Rails.application.routes.draw do
  # 例: ホームページ
  get "home/index"
  root "home#index"

  # ヘルスチェック（ロードバランサ等用）
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA 用
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end


