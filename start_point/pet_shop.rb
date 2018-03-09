def pet_shop_name(pet_shop_data)
  return pet_shop_data[:name]
end

def total_cash(pet_shop_data)
  return pet_shop_data[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop_data,amount)
  return pet_shop_data[:admin][:total_cash] += amount
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
  pet = {}
  for i in pet_shop_data[:pets]
    if i[:name] == name
      pet[:name] = name
    end
  end
  return nil if pet.empty?
  return pet
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
# End of file
