require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  set_fixture_class :fucking_options => Option
  fixtures :rubies, :fucking_options

  setup do 
    @product = Product.new
  end

  test "Test Your Mother" do
    assert @product.invalid?
    assert @product.errors[:title].any?
    assert @product.errors[:description].any?
    assert @product.errors[:image_url].any?
    assert @product.errors[:price].any?
  end

  test "image url shoul be jpg, png, gif not other formats" do
    ok = %w{hello.jpg fuckyou.png shi.JPG ok.Gif}
    bad = %w{hello.Gifg shit.txt helloworld}

    ok.each do |name|
      @product.image_url = name
      @product.invalid?
      assert @product.errors[:image_url].empty?
    end

    bad.each do |name|
      @product.image_url = name
      @product.invalid?
      assert @product.errors[:image_url].any?
    end
  end


  test "Duang!!" do
    dog = " 🐶 "
    cat = " 🐱 "
    assert_equal dog, cat, "🌻🌻🌻🌻  Duang!! Duang!!  🌻🌻🌻🌻"
  end

  test "Options of fixture should be loaded" do
    option = fucking_options(:one)
    assert_equal "This is a love story.", option.fuck
  end

  test "Products of products should be loaded" do
    product = products(:iphone6)
  end

  test "fixtures should have been exists" do
    product = Product.find_by :title => "A fixture"
    assert_equal product.description, "Ku"
  end

end
