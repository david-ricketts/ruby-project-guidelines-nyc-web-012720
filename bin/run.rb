require_relative '../config/environment'




def pizza_shop
    puts "Hello, are you a guest or the owner?"
    input = gets.chomp
    if input == "guest"
        customer_prompt()
    else
        restaurant_prompt()
    end
end


def restaurant_prompt
    puts "Welcome please enter the name of the restaurant"
    restaurant = gets.chomp
    puts "Welcome to #{restaurant} portal, How may I assist you?"
    restaunt_loop(restaurant)
end



def customer_prompt
    puts "Welcome please enter you name"
    customer = gets.chomp
    Customer.find_or_create_by(name: customer)
    puts "Hello #{customer}, We have cheese slices for $2.00 and pepperoni for $3.00" 
    puts "Please press a number so I may better assist you"
    customer_loop(customer)
end

def customer_loop(person_ordering, total = 0)
    
    person_obj = Customer.find_or_create_by(name: person_ordering)
    restaurant = Restaurant.find_or_create_by(name: "Tonys")
    
    puts "Press 1 to get a cheese slice \n
    Press 2 to get a pepperoni slice \n 
    Press 3 to get a to get your total \n
    Press 4 to get a complete your order \n
    Press 5 to exit"
    
    request = gets.chomp
    case(request)
    when "1"
        total += 2
        puts "One cheese slice added"
    when "2"
        total += 3
        puts "One pepperoni slice added"
    when "3"
        puts "Your current total is $#{total}"
    when "4"
        new_balance = person_obj.bank_account
        new_balance -= total
        if  new_balance < 0 
            p "No free pizza, goodbye"
        else
        person_obj.update(bank_account: new_balance)
        Receipt.create(
            customer_id: person_obj.id,
            restaurant_id: restaurant.id,
            total: total
            )
        p "$#{total!}, Thank you and enjoy the pizza :-)"
        end
        binding.pry
    when "5"
        return
    end
    #binding.pry
    customer_loop(person_ordering, total)
end



def restaunt_loop (restaurant = "Tonys")
    restaurant_obj = Restaurant.find_or_create_by(name: restaurant)
    puts "Press 1 to get receipts \nPress 2 refund last receipt \nPress 3 to exit"
    
    request = gets.chomp
    
    case(request)
    when "1"
        the_receipts = restaurant_obj.get_receipts
        p the_receipts
    when "2"
        restaurant_obj.refund

    when "3"
        return
    end
    restaunt_loop(restaurant)
end

# puts "Hello world"

pizza_shop


