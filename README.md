> Web App Project School

![](https://lh3.googleusercontent.com/TSuYl_73Ic7ZitWc2hbIsg-ft97jhDxV2RcBmqSCY8Y5kVNA448p88C-etCbqduaKr_jiCs9r57zKBA=w1316-h629-rw)

![](https://lh6.googleusercontent.com/dA5UWiSyoDXCeFnoAoXnxAQKuuVOJ0TCFzG5Y_f7xj3_nvbVsrolJjHItSXazLKfhlDIJ_9WQYuq-TQ=w1316-h629-rw)

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
