# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Spree::Core::Engine.load_seed
Spree::Auth::Engine.load_seed

admin_role = Spree::Role.find_or_create_by(name: "admin")

admin = Spree::User.find_or_create_by(email: "admin@mystore.com") do |user|
    user.password = "password"
    user.password_confirmation = "password"
end

unless admin.spree_roles.include?(admin_role)
  admin.spree_roles << admin_role
end

admin.save
