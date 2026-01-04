#language: pt

Funcionalidade: Pesquisar Funcionarios
    Para averiguar informacoes
    O usuario do sistema
    Deseja consultar informacoes dos Funcionarios

    Cenario: Buscar informacoes de funcionario 
        Dado que o usuario consulte informacoes de funcionario
        Quando ele realizar a pesquisa 
        Entao uma lista de usuario deve retornar

    @cenario_dois   
    Cenario: Cadastrar funcionario
        Dado que o usuario cadastre um novo funcionario
        Quando ele enviar as informacoes do funcionario
        Entao esse funcionario sera cadastrado

    @cenario_tres
    Cenario: Editar funcionario
    Dado que um usuario edite um funcionario
    Quando ele enviar as novas informacoes
    Entao as informacoes serao alteradas
    
    @cenario_quatro
    Cenario: Deletar funcionario
    Dado que um usuario deseja deletar um funcionario
    Quando ele enviar a identificacao unica
    Entao esse funcionario sera deletado do sistema