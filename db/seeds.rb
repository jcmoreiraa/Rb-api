User.create!([
  { nome: 'Júlio César Silva Moreira', email: 'juliomoreira@ufba.br' },
  { nome: 'Laís Abbid Gonzalez', email: 'laisgonzalez@ufba.br' }
])

puts "Usuários criados com sucesso!"

user = User.find_by(email:"juliomoreira@ufba.br")
if user 
  user.destroy
  puts 'destruido' 
  if user.destroyed?
    puts 'cu'
  end

end