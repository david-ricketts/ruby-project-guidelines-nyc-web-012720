class Receipt < ActiveRecord::Base
    belongs_to :restaurant
    belongs_to :customer
end