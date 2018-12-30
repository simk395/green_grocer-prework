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
  grocery, coupon_item = cart.keys, ""
  coupons.each do |discount|
    coupon_item = "#{discount[:item]} W/COUPON"
    if grocery.include?(discount[:item]) && discount[:num] < cart[discount[:item]][:count]
      cart[coupon_item] = {}
      cart[coupon_item][:price] = discount[:cost]
      cart[coupon_item][:clearance] = cart[discount[:item]][:clearance]
      cart[coupon_item][:count] = 1
      cart[discount[:item]][:count] = (cart[discount[:item]][:count] - discount[:num])
    end
  end
  cart
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
