# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
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

Role.create!([
                { name: 'admin' },
                { name: 'user' },
                { name: 'client' }
              ])