DeviseTokenAuth.setup do |config|
  # リクエストごとにトークンを更新するか
  # 扱いやすいようにFalseにします
  config.change_headers_on_each_request = true

  # トークンの有効期間
  # デフォルトでは2週間です
  config.token_lifespan = 4.weeks

  # ヘッダーの名前対応
  config.headers_names = {:'access-token' => 'access-token',
                          :'client' => 'client',
                          :'expiry' => 'expiry',
                          :'uid' => 'uid',
                          :'token-type' => 'token-type' }
end
