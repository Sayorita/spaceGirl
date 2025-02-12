class Pagamento
  include Mongoid::Document
  include Mongoid::Timestamps
  field :transaction_id, type: String
  field :status, type: String
  field :amount, type: Float
  field :payer_email, type: String
end
