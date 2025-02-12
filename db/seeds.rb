# Criando produtos iniciais
Produto.create([
  { nome: "Camiseta", descricao: "Camiseta de algodão", preco: 29.99 },
  { nome: "Calça Jeans", descricao: "Calça jeans azul", preco: 59.99 }
])

# Criando um usuário administrador
User.create!(
  email: 'us@yahoo',
  password: '1234',
  password_confirmation: '1234'
)