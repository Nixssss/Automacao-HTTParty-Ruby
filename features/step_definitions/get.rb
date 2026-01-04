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

Dado('que o usuario cadastre um novo funcionario') do
 @post_url = 'http://dummy.restapiexample.com/api/v1/create'
end

Quando('ele enviar as informacoes do funcionario') do
@create_employee = HTTParty.post(
  @post_url,
  headers: { 'Content-Type' => 'application/json' },
  body: {
    id: 25,
    employee_name: "Lando Norrys",
    employee_salary: "7000",
    employee_age: "31",
    profile_image: ""
  }.to_json
)


    puts @create_employee
end

Entao('esse funcionario sera cadastrado') do
    expect(@create_employee.code).to eql 200
    expect(@create_employee.message).to eql 'OK'
    expect(@create_employee["status"]).to eql 'success'
    expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
    expect(@create_employee['data']["employee_name"]).to eql 'Lando Norrys'
    expect(@create_employee['data']["employee_salary"]).to eql '7000'
    expect(@create_employee['data']["employee_age"]).to eql '31'

end

Dado('que um usuario edite um funcionario') do
    @get_employee = HTTParty.get('http://dummy.restapiexample.com/api/v1/employees', :headers => { 'Content-Type' => 'application/json' })
    @put_url = 'http://dummy.restapiexample.com/api/v1/update/' + @get_employee['data'][0]['id'].to_s
end

Quando('ele enviar as novas informacoes') do
    @update_employee = HTTParty.put( @put_url, :headers => { 'Content-Type' => 'application/json' }, body: {
            "employee_name": "joao pedro",
            "employee_salary": "7500",
            "employee_age": "28",
            "profile_image": ""
        
    }.to_json)
    puts (@update_employee)
        
end

Entao('as informacoes serao alteradas') do
    expect(@update_employee.code).to eql 200
    expect(@update_employee.message).to eql 'OK'
    expect(@update_employee["status"]).to eql 'success'
    expect(@update_employee["message"]).to eql 'Successfully! Record has been updated.'
    expect(@update_employee['data']["employee_name"]).to eql 'joao pedro'
    expect(@update_employee['data']["employee_salary"]).to eql '7500'
    expect(@update_employee['data']["employee_age"]).to eql '28'

end