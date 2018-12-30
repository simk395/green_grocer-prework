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
  grocery = cart.keys
  coupons.each do |discount|
    if grocery.include?(discount[:item]) && discount[:num] < cart[discount[:item]][:count]
      cart["#{discount[:item]} W/COUPON"] = cart[discount[:item]]
      cart["#{discount[:item]} W/COUPON"][:price] = discount[:cost]
      cart["#{discount[:item]} W/COUPON"][:count] = 1
      cart[discount[:item]][:count] = (cart[discount[:item]][:count] - discount[:num])
    end
  end
  
end

a = {
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 2},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
}

b = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00},
  {:item => "BEER", :num => 2, :cost => 20.00},
  {:item => "CHEESE", :num => 3, :cost => 15.00}
]



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
end
