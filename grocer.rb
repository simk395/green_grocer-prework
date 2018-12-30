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
  copy = cart.clone
  cart.each do |cart_item, cart_data|
    coupons.each do |coupon_item|
      if cart_item == coupon_item[:item] && coupon_item[:num] < cart_data[:count]
        copy[cart_item][:count] = cart_data[:count] - coupon_item[:num]
        
        binding.pry
      end
    end
  end
end

a = {
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 3},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
}
b = [{:item => "AVOCADO", :num => 2, :cost => 5.0}]

apply_coupons(a,b)
def apply_clearance(cart)
  # code here
  cart.each do |item, data|
    if data[:clearance] == true
      data[:price] = (data[:price]*0.8).round(2)
    end
  end
end

def checkout(cart, coupons)
  # code here
  total = 0
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  cart.each do |item,data|
    total += data[:price]
  end
  if total > 100
    return (total*0.9)
  else
    return total
  end
end
