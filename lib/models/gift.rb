#creating a gift class
ActiveRecord::Base.logger = nil
class Gift < ActiveRecord::Base
    has_many :gift_items
    has_many :stores, through: :gift_items

    @@prompt = TTY::Prompt.new

    def item_info(selected_gift)
        selected_gift_stores = self.stores.collect do | store |
            store.name
        end
        puts "\nHere is the information about #{self.name}: \nType: #{self.gift_type} \nCost: #{self.price} \nStores it can be found in: #{selected_gift_stores.join(", ")}\n"
    end

    def self.view_item(selected_store)
        selected_item = @@prompt.select("What item you like to view?") do | menu | 
            selected_store.gifts.map do |g| 
                menu.choice g.name, g
            end
        end
        selected_item
    end

    def self.edit_item(selected_item)
        puts "\nHere is the information about your item: \nSelected item: #{selected_item.name} \nType: #{selected_item.gift_type} \nCost: #{selected_item.price}"
        edit_item = @@prompt.select("What would you like to edit about the item: #{selected_item.name}?", %w(Name Type Price))
        if edit_item == "Name"
            name_edit = @@prompt.ask("\nWhat would you like to change the name of #{selected_item.name} to?")
            selected_item.update(name: name_edit)
            puts "Name changed to #{selected_item.name}!"
        elsif edit_item == "Type"
            type_edit = @@prompt.ask("\nWhat would you like to change the type of #{selected_item.name} to?")
            selected_item.update(gift_type: type_edit)
            puts "Type changed to #{selected_item.type}!"
        elsif edit_item == "Price"
            price_edit = @@prompt.ask("\nWhat would you like to change the price of #{selected_item.name} to?", convert: :float)
            selected_item.update(price: price_edit)
            puts "Price changed to #{selected_item.price}!"
        end
    end

    def self.create_item(selected_store)
        item_name = @@prompt.ask("What is the name of the item you are adding?")
        item_price = @@prompt.ask("What is the price of the #{item_name}?")
        item_type = @@prompt.ask("What type of item is the #{item_name}?")

        new_gift = Gift.create(name: item_name, price: item_price, gift_type: item_type)
        GiftItem.create(store_id: selected_store.id, gift_id: new_gift.id)
        puts "#{item_name} has been added to the iventory of #{selected_store.name}."
    end

    def self.add_to_inv(selected_store)
        puts "\nHere are a list of items you can add to the inventory of #{selected_store.name}:"
        selected_item = @@prompt.select("What item would you like to add?") do | menu | 
            self.all.map do |s| 
                menu.choice s.name, s
            end
        end
        GiftItem.create(store_id: selected_store.id, gift_id: selected_item.id)
        puts "#{selected_item.name} has been added to the iventory of #{selected_store.name}."
    end

    def self.remove_item(selected_store)
        selected_item = @@prompt.select("Which item would you like to remove?") do | menu | 
            selected_store.gifts.map do |s| 
                menu.choice s.name, s
            end
        end
        puts "#{selected_item.name} has been removed from the inventory of #{selected_store.name}!"
        selected_item.gift_items.destroy
        selected_item.destroy
    end
end