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