# Lucas Coutinho Jovencio

Teste tecnico para desenvolvedor, desenvolvido com as tecnologias:

  - Ruby 2.6.6p146
  - Rails 6.0.2.2
  - Sqlite3 ~1.4

# Instalação
  - bundle install
  - rails db:migrate
  - rails db:seed
  - rails db:migrate RAILS_ENV=test
  - rails server

# Postman

Na raiz do projeto tem duas versões de postman para usar nos testes
  - api.postman_v1.json
  - api.postman_v2.json

# Cobertura de testes
  Validação de entrada de dados nos modelos do sistema.
  - bundle exec rspec spec/models/
    
    ou manual
      - bundle exec rspec spec/models/pokedex_spec.rb
      - bundle exec rspec spec/models/pokedex_type_spec.rb
      - bundle exec rspec spec/models/type_spec.rb
      - bundle exec rspec spec/models/user_spec.rb

# Swagger
  - [Documentação em swagger](https://app.swaggerhub.com/apis/jovencio/pokemon/1.0.0)
    

-------------
-------------


# Desafio Neolife Ruby on Rails

## Criar uma API de Pokemons com autenticação e rotas protegidas

Criar uma API com suporte a criação, edição, exclusão e leitura, usando a seguinte
[Base de dados](https://github.com/fanzeyi/pokemon.json)
A autenticação deve ser [JWT](https://jwt.io/)

## O que será avaliado:

- Arquitetura e bibliotecas escolhidas para desenvolvimento do teste;
- Qualidade e simplicidade do código;
- Funcionamento do produto entregue;
- Seguir o padrão RESTful;

## Rotas

### Usuários

- Endpoint de login (JWT);
- Endpoint de cadastro;
- Endpoint de editar perfil;

### Pokemons

- Endpoint para listagem;
- Endpoint para criação;
- Endpoint para edição;
- Endpoint para exclusão;
- Endpoint para detalhamento;

## A solução DEVE conter

- Manual do setup no readme.md;
- Postman mapeando todos os endpoints;
- Carregamento da `Base de dados` através do arquivo `seed.rb`;
- Cobertura de testes com [RSpec](https://rspec.info/) (ou qualquer outra ferramenta, justifique);

### **Ganha + pontos se conter**

- Documentação com [Swagger](https://swagger.io/) (ou qualquer outra ferramenta, justifique);
- Setup do projeto com docker;
- Variáveis de environment setadas por ambiente (não hard coded);

### Sugestões

- Utilizar as versões mais recentes das bibliotecas;
- Utilizar MySQL/PostgreSQL para armazenar os dados;

### Processo de submissão

- Faça um fork deste projeto em sua conta no [Github](https://github.com/join) (crie um repositório privado).
- Em seguida, desenvolva o projeto em seu repositório privado.
- Por fim, adicione como membro do repositório o usuário (@welingtonsampaio) ao seu repositório, quando fizer isto, avise-nos por e-mail, avaliaremos o mais rápido possível e te daremos o feedback.

_Boa sorte!_
