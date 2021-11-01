require 'pry'
class CashRegister

    attr_accessor :discount, :total, :quantity, :title, :price

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @item_list = []
    end
    def add_item(title, price, quantity = 1)
        @price = price
        @quantity = quantity
        @total = self.total + price * quantity
        quantity.times { @item_list << title }
    end
    def apply_discount
        if discount > 0
            @total = self.total - self.total*(self.discount/100.to_f)
            "After the discount, the total comes to $#{self.total.round}."
        else
            "There is no discount to apply."
        end
    end
    def items
        @item_list
    end
    def void_last_transaction
        # binding.pry
        @quantity.times { @total = @total - @price }
        @item_list.pop
        # binding.pry
        if @item_list.length == 0
            @total = 0.0
        end
    end
end