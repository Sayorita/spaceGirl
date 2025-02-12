class ProdutosController < ApplicationController
  def index
    @produtos = Produto.page(params[:page]).per(10)
    puts @produtos.inspect # Exibe os produtos no terminal
  end
end