Order.transaction do ||
  (101..1000).each do |i|
    Order.create :name => "Name #{i}", 
                 :address => "Main Street #{i}",
                 :email => "mail@#{i}example.com",
                 :pay_type => "fuck"
  end
end