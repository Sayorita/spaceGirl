class ItemCarrinho
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Document
  belongs_to :carrinho
  belongs_to :produto

  field :produto_id, type: BSON::ObjectId
  field :quantidade, type: Integer, default: 1

end
