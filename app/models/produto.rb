class Produto
  include Mongoid::Document
  include Mongoid::Timestamps
  field :nome, type: String
  field :imagem, type: String
  field :descricao, type: String
  field :preco, type: Float
  has_one :carrinho, dependent: :destroy
end
