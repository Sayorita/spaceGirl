class PagamentosController < ApplicationController
  before_action :authenticate_user!

    # Exibir a página de pagamento
  def pagar
    @carrinho = current_user.carrinho || current_user.create_carrinho
    @itens_carrinho = @carrinho.item_carrinho.includes(:produto)
    @total = @carrinho.total

    # Certifique-se de que o carrinho não está vazio
    if @itens_carrinho.empty?
      redirect_to carrinho_path, alert: 'Seu carrinho está vazio.'
    end
  end

  def create
    # Configurar o SDK do Mercado Pago
    require 'mercadopago'
    sdk = Mercadopago::SDK.new(ENV['MERCADO_PAGO_ACCESS_TOKEN'])

    # Criar os dados do pagamento
    payment_data = {
      transaction_amount: params[:transaction_amount].to_f,
      token: params[:token],
      description: params[:description],
      installments: params[:installments].to_i,
      payment_method_id: params[:payment_method_id],
      payer: {
        email: params[:payer_email]
      }
    }

    # Criar o pagamento usando o SDK
    payment_response = sdk.payment.create(payment_data)

   if payment_response[:response][:status] == 'approved'
      # Limpar o carrinho após o pagamento
      carrinho = current_user.carrinho
      carrinho.item_carrinho.destroy_all

      redirect_to pagamento_sucesso_path, notice: 'Pagamento aprovado!'
    else
      redirect_to pagamento_falha_path, alert: 'Falha no pagamento.'
    end
  end

  def sucesso
    render 'pagamentos/sucesso'
  end

  def falha
    render 'pagamentos/falha'
  end

end