class Customer < ActiveRecord::Base
    has_many :receipts
    has_many :restaurants, through: :receipts
end