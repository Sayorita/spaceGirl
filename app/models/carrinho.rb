class Carrinho
  include Mongoid::Document
  belongs_to :user
  has_many :item_carrinho, dependent: :destroy

  def total
    item_carrinho.sum { |item| item.quantidade * item.produto.preco }
  end
end
