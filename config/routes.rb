Rails.application.routes.draw do
  devise_for :users
  resources :produtos, only: [:index]
  post '/adicionar_ao_carrinho/:id', to: 'carrinhos#adicionar_produto', as: 'adicionar_produto'
  get '/carrinho', to: 'carrinhos#mostrar', as: 'carrinho'
  patch '/carrinho/atualizar/:id', to: 'carrinhos#atualizar_quantidade', as: 'atualizar_quantidade'
  delete '/carrinho/remover/:id', to: 'carrinhos#remover_item', as: 'remover_item'
  get '/pagamento/finalizar', to: 'pagamentos#pagar', as: 'pagar'
  post '/pagamento', to: 'pagamentos#create', as: 'pagamento'
  get "/pagamento/sucesso/:id", to: "pagamentos#sucesso", as: "sucesso"
  get "/pagamento/recusado/:id", to: "pagamentos#recusado", as: "recusado"
  root "produtos#index"
end