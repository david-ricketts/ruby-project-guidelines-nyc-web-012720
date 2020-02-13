require_relative '../config/environment'


# def restaurant_code
#     puts "Welcome please enter the name of the restaurant"
#     restaurant = gets.chomp
#     Restaurant.find_or_create_by(name: restaurant)
#     puts "Welcome to #{restaurant} portal, How may I assist you?"
#     restaunt_loop(restaurant)
# end





def customer_code
    puts "Welcome please enter you name"
    customer = gets.chomp
    Customer.find_or_create_by(name: customer)
    puts "Hello #{customer}, We have cheese slices for $2.00 and pepperoni for $3.00" 
    puts "Please press a number so I may better assist you"
    customer_loop(customer)
end

def customer_loop(person_ordering, total = 0)
    
    person = Customer.find_or_create_by(name: person_ordering)
    restaurant = Restaurant.find_or_create_by(name: "Tonys")
    
    puts "Press 1 to get a cheese slice \n
    Press 2 to get a pepperoni slice \n 
    Press 3 to get a to get your total \n
    Press 4 to get a complete your order \n
    Press 5 to exit"
    
    request = gets.chomp

    # binding.pry
    case(request)
    when "1"
        total += 2
        puts "One cheese slice added"
    when "2"
        total += 3
        puts "One pepperoni slice added"
    when "3"
        puts "Your current total is #{total}"
    when "4"
        
        new_bank_account = person.bank_account - total
        if new_bank_account < 0 
            p "No free pizza, goodbye"
        else
        person.update(bank_account: new_bank_account)
        Receipt.create(
            customer_id: person.first,
            restaurant_id: restaurant.first,
            total: total
            )
        p "$#{total!}, Thank you and enjoy the pizza :-)"
        end
    when "5"
        return
    end
    #binding.pry
    customer_loop(person_ordering, total)
end



# def restaunt_loop (restaurant)
#     puts "Press 1 to get receipts \n
#     Press 2 refund last receipt \n"

#     request = gets.chomp


#  while request == 1 do
#         self.receipts
#     while request == 2 do
#         self.refund
#     while request == 3 do
#         puts "Your current total is #{total}"
#         request = 0
#     while request == 4 do
#         new_bank_account = person_ordering.bank_account - total
#         if new_bank_account < 0 
#             p "No free pizza, goodbye"
        
#         person_ordering.update(bank_account: new_bank_account)
#         p "$#{total}, Thank you and enjoy the pizza :-)"
#     while request == 5 do
#         return
#     end
#     restaunt_loop(restaurant)
# end


# puts "Hello world"

customer_code



