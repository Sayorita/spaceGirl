class Pedido
  include Mongoid::Document
  include Mongoid::Timestamps

  field :total, type: Float
  field :status, type: String, default: "pendente" # Pode ser: "aprovado", "cancelado"
  field :metodo_pagamento, type: String
  field :payment_id, type: String # ID da transação do Mercado Pago

  belongs_to :user
  has_many :item_pedido, dependent: :destroy
end
