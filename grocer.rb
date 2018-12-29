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
  i = cart
  cart.each do |cart_item|
    cart_item.each do |cart_name, cart_data|
      coupons.each do |coupons_name, coupons_data|
        if cart_name == coupons_data
          i["#{cart_name} W/COUPON"] = {}
        end
        binding.pry
      end#coupons
    end#item
  end#cart
end

def apply_clearance(cart)
  # code here
  cart.each do |item|
    item.each do |name, data|
      if data[:clearance] == true
        data[:price] = (data[:price]*0.8)
      end
    end
  end
end

def checkout(cart, coupons)
  # code here
end

a = {
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 3},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
}

b = {:item => "AVOCADO", :num => 2, :cost => 5.0}


apply_coupons(a,b)
