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
  cart.each do |cart_item|
    item.each do |cart_name, cart_data|
      coupons.each do |coupons_name, coupons_data|
        if cart_name == coupons_data
          cart["#{cart_name} W/COUPON"] = {}
          binding.pry
        end#if
      end#coupons
    end#item
  end#cart
end

-subtract
-change price
-append clearance
-add count to avocado

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

a = {
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 3},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
}

b = {:item => "AVOCADO", :num => 2, :cost => 5.0}

{
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 1},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1},
  "AVOCADO W/COUPON" => {:price => 5.0, :clearance => true, :count => 1},
}

apply_coupons(a,b)
