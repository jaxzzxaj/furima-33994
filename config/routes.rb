Rails.application.routes.draw do
  #下記のdevise_for :usersはユーザーの登録やログイン、ログアウトの機能は実装されている。
  devise_for :users
  #"/"のリクエストをされたときに行動するアクションを設定。
  root to: 'products#index'

  #テーブルに対して、許可するアクションの設定。
  #productとorderをネストする（productのアクションの中身をorderにも使えるようにするため）
  resources :products do
    resources :orders, only: [:index, :create]
  end
end
