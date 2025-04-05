Rails.application.routes.draw do
  # ホームページ（root）へのルート
  root "home#index"

  # ホームコントローラーの index アクション
  get "home/index"

  # ヘルスチェック（ロードバランサーなど用）
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA 用のエンドポイント
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # 必要に応じて他のルートを追加
end

