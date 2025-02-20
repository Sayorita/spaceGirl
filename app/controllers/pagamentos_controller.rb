class PagamentosController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token


  def pagar
    @carrinho = current_user.carrinho || current_user.create_carrinho
    @itens_carrinho = @carrinho.item_carrinho.includes(:produto)
    @total = @carrinho.total.to_f

    if @itens_carrinho.empty? || @total <= 0
      redirect_to carrinho_path, alert: 'Seu carrinho está vazio.'
    end
  end

   def create
    require 'mercadopago'
    sdk = Mercadopago::SDK.new(ENV['MERCADO_PAGO_ACCESS_TOKEN'])
    # binding.pry
    payment_data = {
      transaction_amount: params[:transaction_amount].to_f,
      token: params[:token],
      description: params[:description],
      installments: params[:installments].to_i,
      payment_method_id: params[:payment_method_id],
      payer: {
        email: params[:payer][:email],
        identification: {
          type: params[:payer][:identification][:type],
          number: params[:payer][:identification][:number]
        },
        first_name: params[:cardholderName]
      }
    }

    payment_response = sdk.payment.create(payment_data)
    payment = payment_response[:response] || {}

    pedido = Pedido.create!(
      user: current_user,
      total: payment["transaction_amount"],
      status: "aprovado",
      metodo_pagamento: payment["payment_method_id"],
      payment_id: payment["id"]
    )

    if payment["status"] == "approved"
      # Limpar o carrinho do usuário se houver itens

      current_user.carrinho.item_carrinho.each do |item|
      pedido.item_pedido.create!(
        produto_nome: item.produto.nome,
        quantidade: item.quantidade,
        preco_unitario: item.produto.preco
      )
    end

      current_user.carrinho.item_carrinho.destroy_all
      render json: { success: true, redirect_url: sucesso_path(pedido) }
    else
      render json: { success: false, redirect_url: recusado_path(pedido) }
    end
  end

def sucesso
  @pedido = Pedido.find(params[:id])
end

def recusado
  @pedido = Pedido.find(params[:id])
end
end