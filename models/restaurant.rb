class Restaurant < ActiveRecord::Base
    has_many :receipts
    has_many :customers, through: :receipts

    def receipts
        Receipt.all.select do |receipt|
            receipt.restaurant == self
        end
    end


    def refund
        if receipts.lenght > 0
            receipts.last.delete
        else
            puts "You have no sales"
        end
    end

end