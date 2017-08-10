> Web App Project School
{<img src="https://codeclimate.com/github/raphael27atm/project-school/badges/gpa.svg" />}[https://codeclimate.com/github/raphael27atm/project-school]

![](http://secaoweb.com.br/wp-content/uploads/2017/08/login.png)

![](http://secaoweb.com.br/wp-content/uploads/2017/08/resume.png)

### Objetivo da Aplicação

Criar uma aplicação básica de uma escola, onde a aplicação irá possuir as seguintes entidades:

* Escola
* Unidade (Uma escola pode ter unidades educacionais em vários locais da cidade)
* Turmas
* Professores
* Alunos (podem estar em várias turmas e pode ter vários responsáveis)
* Responsáveis
* Usuário da Escola (Usuário que vai fazer login na plataforma para ver as informações)

### Instalação

Baixe o projeto ou faça a clonagem e siga os comandos:
```
cd <path>
bundle install
rails s
```

### Criando o banco e fazendo a migração de dados
comando
```
rake db:create
rake db:migrate
rake db:seed
```

### Test Rspec
comando
```
rspec
```
### Autenticação
* email: moderator@school.com.br
* senha: school
