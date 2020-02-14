
c1 = Customer.create(name: "John", address: "123 some road", bank_account: 2134987)
c2 = Customer.create(name: "Steve", address: "954 some road", bank_account: 2134987)
c3 = Customer.create(name: "David", address: "42 some road", bank_account: 2134987)
c4 = Customer.create(name: "Jason", address: "2 some road", bank_account: 2134987)
c5 = Customer.create(name: "Mike", address: "4 some road", bank_account: 2134987)


r1 = Restaurant.create(name: "Momo", address: "23 some road")
r2 = Restaurant.create(name: "Chipotle", address: "134 some road")
r3 = Restaurant.create(name: "Luigi's", address: "15 some road")
r4 = Restaurant.create(name: "Mario's", address: "387 some road")

rc1 = Receipt.create(customer_id: 1, restaurant_id: 1, total:15)
rc2 = Receipt.create(customer_id: 2, restaurant_id: 2, total:115)
rc3 = Receipt.create(customer_id: 3, restaurant_id: 3, total:12)
rc4 = Receipt.create(customer_id: 2, restaurant_id: 4, total:19)
rc5 = Receipt.create(customer_id: 3, restaurant_id: 3, total:12)
rc6 = Receipt.create(customer_id: 5, restaurant_id: 2, total:8)