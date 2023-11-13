# desafio-0m30-backend
## [Link do desafio](https://github.com/OM30/desafio-OM30/blob/master/DesafioBackendRuby.md)

### Introdução
  Aplicação cadastra munícipe com seu respectivo endereço. Onde se permite, cadastrar novo, listar e pesquisar.

> Estou utilizando Makefile para rodar os comando mais usados.

### Instalação e execução da aplicação
- Instale o docker. [link docker](https://docs.docker.com/compose/install/)
- Instale o docker compose. [link docker-compose](https://docs.docker.com/compose/install/linux/)
- Iniciar a aplicação: ``$ make start``.
- Iniciar a com rebuild(--build --remove-orphans): ``$ make start-build``.
- Desligar a aplicação(removendo recursos não utilizados no Docker): ``$ make stop``.
- Rodar seed: ``$ make seed``.
- Criar banco e rodar migrações caso seja necessario: ``$ make create``.
- Reseta o banco de dados e roda seed: ``$ make restart``.
- Executa os testes. obs:(Você pode passar os argumentos do RSpec logo após o comando. ARG='argumentos'): ``$ make rspec ``.
- Entra no console: ``$ make console``.

### Para acesso local: http://0.0.0.0:3000/

### Para acesso produção: https://desafio-om30.casaeacessorios.com.br/

### Observações
  - Deploy feito no Heroku
  - Estou utilizando Github Actions para rodar os testes antes do PR
  - O modelo Address, resolvi fazer ele polimorfico, pensando que ele pode ser reutilizado em outros modelos que vao ter endereço no sistema
  - Criei uma Classe para controlar o CNS, onde eu faço a validação do núnmero e implementei tambem geração, caso possivel evolução do sistema
  - Optei utilizar o ransack para busca no sistema por sem mais pratico
  - Paginação feita usando kaminari
  - Templete baseado no bootstrap
  - Na parte das views optei por fazer algo simples para exibir todos os dados dos clientes
  - Para facilitar o cadastro do endereço, estou usando um serviço externo para consultar o cep
  - Estou utilizando a gem Bullet, ajudar a aumentar o desempenho do seu aplicativo, reduzindo o número de consultas que ele faz. Ele observa as consultas e notifica quando se deve adicionar carregamento antecipado (consultas N+1), quando estiver usando carregamento antecipado que não é necessário e quando você deve usar cache de contador.
  - 