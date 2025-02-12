Rails.application.routes.draw do
  # Rotas para autenticação de usuários
  devise_for :users

    # Rotas para produtos
  resources :produtos, only: [:index]

  # Rota para adicionar produtos ao carrinho
  post '/adicionar_ao_carrinho/:id', to: 'carrinhos#adicionar_produto', as: 'adicionar_produto'

  get '/carrinho', to: 'carrinhos#mostrar', as: 'carrinho' # Nova rota para a página do carrinho

 post '/pagamento/:id', to: 'pagamentos#create', as: 'pagamento'
get '/pagamento/finalizar/sucesso', to: 'pagamentos#sucesso', as: 'pagamento_sucesso'
get '/pagamento/finalizar/falha', to: 'pagamentos#falha', as: 'pagamento_falha'

 get'/carrinho/finalizar', to: 'pagamentos#pagar', as: 'pagar'

  # Define a rota raiz ("/") para a página de produtos
  root "produtos#index"
end
