puts 'Delete before seeding'
Company.destroy_all
User.destroy_all
Quote.destroy_all
puts "======================"

puts "\n== Seeding the database with seed.rb =="

puts 'Creating 2 fakes companies'
companies = Company.create([{ name: "Rsynk" }, { name: "DevIS" }])
puts '2 companies created!'
puts "======================"
puts "\n"

puts 'Creating admin for Rsynk Admin'
admin = User.create!(
  email: "admin@rsynk.com",
  password: 'password',
  company: companies.first
)
puts 'Admin user at Rsynk created!'
puts "======================"
puts "\n"

companies.each do |company|
  puts "Creating 2 users for #{company.name}"
  2.times do |index|
    User.create!(
      email: "user#{index}@#{company.name.downcase}.com",
      password: 'password',
      company: company
    )
  end
  puts 'Users created!'
  puts "======================"
  puts "\n"
end

puts 'Creating quote sample'
quote = Quote.create!(
  name: "Sample quote",
  company: companies.first
)
puts 'Quote sample created!'
