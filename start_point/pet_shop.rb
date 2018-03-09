def pet_shop_name(pet_shop_data)
  return pet_shop_data[:name]
end

def total_cash(pet_shop_data)
  return pet_shop_data[:admin][:total_cash]
end

def add_or_remove_cash(hash,amount)
  # If it is a customer return their money amount
  if hash.has_key?(:cash)
    return hash[:cash] -= amount
  end
  # Else return shop money
  return hash[:admin][:total_cash] += amount
end

def pets_sold(pet_shop_data)
  return pet_shop_data[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop_data,amount)
  return pet_shop_data[:admin][:pets_sold] += amount
end

def stock_count(pet_shop_data)
  count = 0
  for i in pet_shop_data[:pets]
    count += 1
  end
  return count
end

def pets_by_breed(pet_shop_data,breed)
  list = []
  for i in pet_shop_data[:pets]
    list.push(i[:breed]) if breed == i[:breed]
  end
  return list
end

def find_pet_by_name(pet_shop_data,name)
  for i in pet_shop_data[:pets]
    if i[:name] == name
      return i
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop_data,name)
  for i in pet_shop_data[:pets]
    if i[:name] == name
      pet_shop_data[:pets].delete(i)
    end
  end
end

def add_pet_to_stock(pet_shop_data,new_pet)
  return pet_shop_data[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer,new_pet)
  return customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer,new_pet)
  return true if customer[:cash] >= new_pet[:price]
  return false
end

def sell_pet_to_customer(shop,new_pet,customer)
  return nil if new_pet == nil
  price = new_pet[:price]
  if customer_can_afford_pet(customer,new_pet)
    increase_pets_sold(shop,1)
    add_pet_to_customer(customer,new_pet)
    remove_pet_by_name(shop,new_pet)
    add_or_remove_cash(customer,price)
    add_or_remove_cash(shop,price)
  end
  return false

end
# End of file
