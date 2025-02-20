class CarrinhosController < ApplicationController
  before_action :authenticate_user!

  def adicionar_produto
  produto = Produto.find(params[:id])
  carrinho = current_user.carrinho || current_user.create_carrinho
  item_carrinho = carrinho.item_carrinho.find_or_initialize_by(produto: produto)
  
  item_carrinho.quantidade ||= 0
  item_carrinho.quantidade += 1
  item_carrinho.save

  flash[:notice] = "#{produto.nome} <strong>adicionado</strong> ao carrinho!"
  redirect_to produtos_path
  end

  def mostrar
    @carrinho = current_user.carrinho || current_user.create_carrinho
    @itens_carrinho = @carrinho.item_carrinho.includes(:produto) 
  end

  def atualizar_quantidade
    item = ItemCarrinho.find(params[:id])

    if item.update(quantidade: params[:quantidade].to_i)
      flash[:notice] = "Quantidade de #{item.produto.nome} atualizada!"
      redirect_to carrinho_path
    else
      flash[:danger] = "<strong>Erro ao atualizar</strong> a quantidade de #{item.produto.nome}"
      redirect_to carrinho_path
    end
  end

  def remover_item
    item = ItemCarrinho.find(params[:id])
    produto_nome = item.produto.nome 

    if item.destroy
      flash[:danger] = "#{produto_nome} <strong>removido</strong> do carrinho"
      redirect_to carrinho_path
    else
      flash[:danger] = "<strong>Erro ao remover</strong> #{produto_nome}"
      redirect_to carrinho_path
    end
  end


end