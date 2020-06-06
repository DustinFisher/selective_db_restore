require 'faker'

# Create 100 Users
100.times do
  user = User.create(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )

  # Give each user 10 recipes
  10.times do
    user.recipes.create(name: Faker::Beer.name, grain_to_glass: rand(1..20))
  end

  # Give each user 5 competitions
  5.times do
    user.competitions.create(
      name: "#{Faker::Company.name} Beer Comp",
      description: Faker::Lorem.paragraphs(number: 1).first
    )
  end
end

50.times do
 Hop.create(
   name: Faker::Beer.hop,
   alpha: Faker::Number.decimal(l_digits: 2, r_digits: 1),
   form: %w(pellet whole extract).sample,
   notes: Faker::Lorem.paragraphs(number: 1).first
 )

 Yeast.create(
   name: Faker::Beer.yeast,
   yeast_type: %w(ale lager wheat wine champagne).sample,
   form: %w(dry liquid).sample,
   notes: Faker::Lorem.paragraphs(number: 1).first
 )

 Misc.create(
   name: Faker::Food.ingredient,
   misc_type: %w(spice fining water herb flavor other).sample,
   use: %w(boil mash primary secondary bottling).sample,
   notes: Faker::Lorem.paragraphs(number: 1).first
 )

 Fermentable.create(
   name: Faker::Food.ingredient,
   fermentable_type: %w(grain sugar extract dry adjunct).sample,
   add_after_boil: ActiveModel::Type::Boolean.new.cast(%w(true false).sample),
   notes: Faker::Lorem.paragraphs(number: 1).first
 )
end
