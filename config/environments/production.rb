require "active_support/core_ext/integer/time"

Rails.application.configure do
  # 本番環境ではコードの再読み込みを無効にする
  config.enable_reloading = false

  # 起動時にコードを全て読み込む
  config.eager_load = true

  # フルエラーレポートを無効、キャッシュ有効
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # 静的ファイルは Web サーバー（Apache）に任せるため、通常は false にする
  # config.public_file_server.enabled = false

  # アセットは事前にコンパイルする（config.assets.compile = false）
  config.assets.compile = false

  # アセット配信のためのヘッダー設定（NGINX/Apache 側で行う場合）
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect"  # NGINX の場合

  # Active Storage の設定（ここではローカルファイルシステム）
  config.active_storage.service = :local

  # SSL 強制（本例では false にして、Apache でリダイレクトさせる）
  config.force_ssl = false

  # ログの出力先を STDOUT に設定（コンテナ環境等の場合）
  config.logger = ActiveSupport::Logger.new(STDOUT)
                                       .tap { |logger| logger.formatter = ::Logger::Formatter.new }
                                       .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  config.log_tags = [ :request_id ]
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # マイグレーション後にスキーマをダンプしない
  config.active_record.dump_schema_after_migration = false

  # Rails が生成するパス等に /tracker を付与するための設定
  config.relative_url_root = "/tracker"
end
