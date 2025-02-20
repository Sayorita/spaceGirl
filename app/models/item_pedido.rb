class ItemPedido
  include Mongoid::Document

  field :produto_nome, type: String
  field :quantidade, type: Integer
  field :preco_unitario, type: Float

  belongs_to :pedido
end
