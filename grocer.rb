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
    if cart.has_key?(coupon_item) && (cart[discount[:item]][:count] - discount[:num]) >= 0
      cart[coupon_item][:count] += 1
      cart[discount[:item]][:count] = (cart[discount[:item]][:count] - discount[:num])
      if cart[discount[:item]][:count] == 0
        cart.delete(discount[:item])
      end
    elsif grocery.include?(discount[:item]) && (cart[discount[:item]][:count] - discount[:num]) >= 0 && cart.has_key?(coupon_item) == false
      cart[coupon_item] = {}
      cart[coupon_item][:price] = discount[:cost]
      cart[coupon_item][:clearance] = cart[discount[:item]][:clearance]
      cart[coupon_item][:count] = 1
      cart[discount[:item]][:count] = (cart[discount[:item]][:count] - discount[:num])
    end
  end
  cart
end

def apply_clearance(cart)
  # code here
  cart.each do |item, data|
    if data[:clearance] == true
      data[:price] = (data[:price]*0.8).round(1)
    end
  end
  cart
end

def checkout(cart, coupons)
  # code here
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  total = 0
  cart.each do |item, data|
   total += data[:price]
  end
  if total > 100
    cart.each do |item, data|
      data[:price] = (data[:price]*0.9).round(1)
    end
    else
      return total

  end
end
