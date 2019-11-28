# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.where.not(id: 1).destroy_all
Subject.where.not(slug: 'gnosis').destroy_all

100.times do |i|
  User.create! username: Faker::Name.unique.first_name,
               email: "user-#{i}@fgh.io",
               password: 'dncornholio2323232',
               type: User::Types::LIST.sample,
               location: Faker::Address.city,
               gender: %w|Female Male Nonbinary|.sample,
               age: rand(13..90),
               occupation: Faker::Job.title
end