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
  coupons.each do |array|
    if grocery.include?(items[:item])
      cart["#{array[:item]} W/COUPON"] = cart[array[:item]]
      cart["#{array[:item]} W/COUPON"][:price] = array[:cost]
      cart["#{array[:item]} W/COUPON"][:count] = 1
      cart[array[:item]][:count] = (cart[array[:item]][:count] - array[:num])
    end
  end
  cart
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
  cart.each do |item|
    item.each do |name, data|
      binding.pry
    end
  end

end

apply_clearance(a)

def checkout(cart, coupons)
  # code here
end
