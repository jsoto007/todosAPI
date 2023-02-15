puts "🌱 Seeding spices..."
Categorization.destroy_all
Task.destroy_all

10.times do
   Categorization.create(name: Faker::Company.bs)
end 

50.times do
    categorization = Categorization.order('RANDOM()').first
    task = Task.create(
        description: Faker::Lorem.sentence,
        categorization_id: categorization.id
    )
end 

puts "✅ Done seeding!"
