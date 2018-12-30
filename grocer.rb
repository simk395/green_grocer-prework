require "pry"

def consolidate_cart(cart)
  # code here
  item = {}
  cart.each do |grocery|
    grocery.each do |name, price|
      if item.has_key?(name) != true
        item[name] = price
        item[name][:count] = 1
      elsif item.has_key?(name) == true
        item[name][:count] += 1
      end
    end
  end
  item
end

def apply_coupons(cart, coupons)
  # code here
  cart.each do |item|
    item.each do |name, data|
      coupons.each do |value|
        if value[:item] == name
          cart[:hello] = "hello"
        end
      end
    end
  end
end

[
  {:item => "AVOCADO", :num => 2, :cost => 5.00},
  {:item => "BEER", :num => 2, :cost => 20.00},
  {:item => "CHEESE", :num => 3, :cost => 15.00}
]

def apply_clearance(cart)
  # code here
  cart.each do |item|
    item.each do |name, data|
      if data[:clearance] == true
        data[:price] = (data[:price]*0.8)
      end
    end
  end
  cart
end

def checkout(cart, coupons)
  # code here
end
