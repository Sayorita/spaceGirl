Rails.application.routes.draw do
  devise_for :users
  resources :produtos, only: [:index]
  post '/adicionar_ao_carrinho/:id', to: 'carrinhos#adicionar_produto', as: 'adicionar_produto'
  get '/carrinho', to: 'carrinhos#mostrar', as: 'carrinho'
  get '/pagamento/finalizar', to: 'pagamentos#pagar', as: 'pagar'
  post '/pagamento', to: 'pagamentos#create', as: 'pagamento'
  get "/pagamento/sucesso/:id", to: "pagamentos#sucesso", as: "sucesso"
  root "produtos#index"
end