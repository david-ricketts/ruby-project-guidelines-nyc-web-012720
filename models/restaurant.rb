class Restaurant < ActiveRecord::Base
    has_many :receipts
    has_many :customers, through: :receipts

    def get_receipts
        Receipt.all.select do |receipt|
            if receipt.restaurant == self
                self
            end
        end
    end


    def refund
        if receipts.length > 0
            last_receipt = receipts.last.delete
            return last_receipt
        else
            puts "You have no sales"
        end
    end
end