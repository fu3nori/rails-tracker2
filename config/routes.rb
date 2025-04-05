Rails.application.routes.draw do
  # ホーム画面の表示
  get "home/index"
  root "home#index"

  # ヘルスチェック (ロードバランサー等用)
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA 用ファイルのルーティング
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest"        => "rails/pwa#manifest",        as: :pwa_manifest
end



