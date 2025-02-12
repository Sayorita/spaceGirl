class CarrinhosController < ApplicationController
  before_action :authenticate_user!

  def adicionar_produto
    produto = Produto.find(params[:id])
    carrinho = current_user.carrinho || current_user.create_carrinho
    item_carrinho = carrinho.item_carrinho.find_or_initialize_by(produto: produto)
    item_carrinho.quantidade ||= 0
    item_carrinho.quantidade += 1
    item_carrinho.save
    redirect_to produtos_path, notice: 'Produto adicionado ao carrinho!'
  end

  def mostrar
    @carrinho = current_user.carrinho || current_user.create_carrinho
    @itens_carrinho = @carrinho.item_carrinho.includes(:produto) # Carrega os itens com os produtos associados
  end

end