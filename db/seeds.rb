# Usuarios, clientes y direcciones de prueba
Role.create!([
  { name: 'user' },
  { name: 'admin' },
  { name: 'client' }
])

User.create!([
  { first_name: 'Santiago', last_name: 'Figueroa', email: 'santifmc@gmail.com', password: 'santiago', confirm_password: 'santiago', role_id: 2 }
])

Client.create!([
  { name: 'John Doe', phone: '123456789' },
  { name: 'Jane Doe', phone: '123456789' },
  { name: 'Jack Doe', phone: '123456789' },
  { name: 'Jill Doe', phone: '123456789' },
  { name: 'Joe Doe', phone: '123456789' },
  { name: 'Jenny Doe', phone: '123456789' },
  { name: 'Juan Doe', phone: '123456789' }
])

Address.create!([
  { street: 'Cerro el cepo', city: 'Santiago', state: 'Las Condes', number: '12434', details: 'Casa', client_id: 1 }
])

