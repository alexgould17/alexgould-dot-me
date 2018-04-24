5.times do
  Blog.create!(
    title: Faker::Fallout.location,
    author: Faker::Fallout.character,
    hook: Faker::Fallout.quote,
    body: Faker::Fallout.faction
  )
end

# So that the URLs are actually functional & useful for testing purposes, all site_link's go to Heroku, source_link's go to github & screenshot_link's are my gravatar.
5.times do
  Project.create!(
    title: Faker::Overwatch.hero,
    synopsis: Faker::Overwatch.location,
    description: Faker::Overwatch.quote,
    site_link: "http://www.heroku.com/",
    source_link: "http://www.github.com/",
    screenshot_link: "https://s.gravatar.com/avatar/3539c62050032141a88cb4ff930ba9d2?s=80"
  )
end

puts "Seeding finished! The database now has:"
puts "#{Blog.count} blog posts."
puts "#{Project.count} projects."
