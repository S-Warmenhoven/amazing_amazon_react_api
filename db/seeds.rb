# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Make sure to clear old data out of your db when you run rails db:seed
# In this case, Reviews will also be deleted since Product.destroy_all will
# run our 'dependent: :destroy' callback.
p=Product.destroy_all()
500.times do
  created_at = Faker::Date.backward(days:365 * 5)
  p=Product.create({
    title: Faker::Cannabis.strain,
    description: Faker::Cannabis.health_benefit,
    price: rand(100_000),
    created_at: created_at,
    updated_at: created_at
  })
  if p.valid?
    rand(0..10).times.each do
      Review.create(
        rating: Faker::Number.between(from:1, to:5),
        body: Faker::TvShows::Seinfeld.quote,
        product: p
      )
    end
  end
end



puts "Created #{Product.count} products"
puts "Created #{Review.count} reviews"