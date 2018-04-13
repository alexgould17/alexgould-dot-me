5.times do
  Blog.create!(
    title: Faker::Fallout.location,
    author: Faker::Fallout.character,
    hook: Faker::Fallout.quote,
    body: Faker::Fallout.faction
  )
end

puts "Seeding finished! The database now has:"
puts "#{Blog.count} blog posts."
