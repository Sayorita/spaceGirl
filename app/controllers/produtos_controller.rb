class ProdutosController < ApplicationController
  def index
    @produtos = Produto.page(params[:page]).per(10)
  end
end