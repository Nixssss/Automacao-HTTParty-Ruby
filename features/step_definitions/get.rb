Dado('que o usuario consulte informacoes de funcionario') do
    @get_url = 'http://dummy.restapiexample.com/api/v1/employees'
end

Quando('ele realizar a pesquisa') do
    @list_employees = HTTParty.get(@get_url)
end

Entao('uma lista de usuario deve retornar') do
    expect(@list_employees.code).to eql 200
    expect(@list_employees.message).to eql 'OK'
end