# Criando produtos iniciais
Produto.create([
  { nome: "Pelúcia estrela", descricao: "Pelúcia estrela", preco: 29.99 },
  { nome: "Calça Mochileiro das Galáxias", descricao: "Calça para não entar em pânico", preco: 59.99 },
  { nome: "Camiseta Nebulosa", descricao: "Camiseta com estampa de nebulosa colorida", preco: 49.99 },
  { nome: "Caneca Constelação", descricao: "Caneca com desenho de constelações do hemisfério sul", preco: 24.99 },
  { nome: "Adesivo Planeta Saturno", descricao: "Adesivo holográfico do planeta Saturno com anéis brilhantes", preco: 9.99 },
  { nome: "Chaveiro Nave Espacial", descricao: "Chaveiro em formato de nave espacial futurista", preco: 14.99 },
  { nome: "Almofada Lua Crescente", descricao: "Almofada decorativa no formato de uma lua crescente", preco: 34.99 },
  { nome: "Quadro Galáxia", descricao: "Quadro pintado à mão com tema de galáxia e estrelas", preco: 79.99 },
  { nome: "Brinco Estrela Cadente", descricao: "Brincos delicados no formato de estrelas cadentes", preco: 19.99 },
  { nome: "Boné Astronauta", descricao: "Boné com bordado de astronauta flutuando no espaço", preco: 39.99 },
  { nome: "Luminária Sistema Solar", descricao: "Luminária com planetas do sistema solar suspensos", preco: 89.99 },
  { nome: "Pôster Buraco Negro", descricao: "Pôster artístico de um buraco negro com efeito gravitacional", preco: 29.99 },
  { nome: "Colar Via Láctea", descricao: "Colar com pingente inspirado na Via Láctea", preco: 22.99 },
  { nome: "Relógio Estelar", descricao: "Relógio de parede com design de estrelas e constelações", preco: 64.99 },
  { nome: "Capa de Celular Universo", descricao: "Capa de celular transparente com glitter que imita o espaço", preco: 17.99 },
  { nome: "Livro Exploração Espacial", descricao: "Livro ilustrado sobre a história da exploração espacial", preco: 44.99 },
  { nome: "Copo Térmico Estrelas", descricao: "Copo térmico com estampa de estrelas e galáxias", preco: 27.99 }
])


User.create!(
  email: 'us@yahoo',
  password: '1234567',
  password_confirmation: '1234567'
)