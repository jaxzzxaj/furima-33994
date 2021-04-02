Rails.application.routes.draw do
  #ターミナルでcontroller+indexを記述したとき、一緒にrouteを自動で設定してくれた。
  get 'products/index'
  #"/"のリクエストをされたときに行動するアクションを設定。
  root to: 'products#index'
  #テーブルに対して、許可するアクションの設定。
  resources :products, only: :index
end
