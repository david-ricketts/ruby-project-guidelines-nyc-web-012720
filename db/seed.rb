


Customer.create(name: Faker::Name.name)
Restaurant.create(name: Faker::Company.name)
10.times do

    Customer.create([{
        name: Faker::Name.name,
        address: Faker::Address.address
        bank_account: 0
        }])
end

4.times do
    Restaurant.create([{
            name: Faker::Name,
            address: Faker::Address.address
            
        }])
end