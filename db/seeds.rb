# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "sam.king@organizingempowerment.org", password: "password", password_confirmation: "password")
User.create(email: "sekhar.paladugu@organizingempowerment.org", password: "password", password_confirmation: "password")
User.create(email: "nica.langinger@organizingempowerment.org", password: "password", password_confirmation: "password")
User.create(email: "danielle.beavers@organizingempowerment.org", password: "password", password_confirmation: "password")
User.create(email: "ted.westling@organizingempowerment.org", password: "password", password_confirmation: "password")

User.all.each do |u|
  20.times do |i|
    u.prospects.create(
      name: "Prospect #{i+1}",
      email: "prospect-email-#{i+1}@gmail.com",
      notes: i % 2 == 0 ? "Great convo w/prospect ##{i+1}. #{['Strong', 'Weak'].sample} potential." : nil
    )
  end
end