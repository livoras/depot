# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(:title => "iPhone 6 Plus", 
  :description => %{
    <h2>岂止于大！！</h2>
    <p>iPhone 6 Plus 你值得拥有。</p>
  }, 
  :image_url => "/assets/images/shi.jpg", :price => 6089.6)

