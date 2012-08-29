# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.delete_all
password = "example123"
%w(admin@admin.com reviewer@example.com presenter@example.com).each do |email|
  User.create!(email: email, password: password , password_confirmation: password,
              role: email.split('@').first)
end

u = User.first

Course.delete_all

course = u.courses.create!(title: 'literario activo',
                          description: 'descripcion',
                          starts_at: 2.months.ago,
                          ends_at: 1.month.ago)


u.courses.create!(title: 'literario pasado',
                          description: 'descripcion',
                          starts_at: Time.now,
                          ends_at: 6.months.since)


u.courses.create!(title: 'literario por activar',
                          description: 'descripcion',
                          starts_at: 2.months.since,
                          ends_at: 8.months.since)


  
