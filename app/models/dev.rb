class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.find { |freebie| freebie.item_name == item_name} != nil
    end

    def give_away(dev, freebie)
        can_take = dev.freebies.find_by(id: freebie.id) == nil
        if can_take
            puts "----Adding freebie."
            dev.freebies << freebie
        end
    end
end