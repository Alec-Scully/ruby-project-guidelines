require_relative '../config/environment'

puts "HELLO WORLD"

puts
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "} Welcome to your Holiday Wishlist! {"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts

prompt = TTY::Prompt.new

o_o_s = prompt.select("Are you a store owner or a shopper?", %w(Owner Shopper))
#owner or shopper

if o_o_s == "Owner"
    v_o_c = prompt.select("Would you like to view the stores or create a new store?", %w(View Create))
    #view, create, update stores/item
    
    if v_o_c == "View"
        selected_store = prompt.select("What store would you like to see?") do | menu | 
            Store.all.map do |s| 
                menu.choice s.name, s
            end
        end
        
        v_a_e_c = prompt.select("You have chosen #{selected_store.name}. Would you like to view the stores items, edit current items, or create a new item for sale?", %w(View Edit Add Create))
        #view, add, edit, create items
        if v_a_e_c == "View"
            selected_item = prompt.select("These items are sold in #{selected_store.name} \nWhat item you like to view?") do | menu | 
                selected_store.gifts.map do |g| 
                    menu.choice g.name, g
                end
            end

            puts "Selected item: #{selected_item.name} \nType: #{selected_item.gift_type} \nCost: #{selected_item.price}"
        
        elsif v_a_e_c == "Edit"
            selected_item = prompt.select("These items are sold in #{selected_store.name} \nWhat item you like to edit?") do | menu | 
                selected_store.gifts.map do |g| 
                    menu.choice g.name, g
                end
            end

            puts "Here is the information about your item: \nSelected item: #{selected_item.name} \nType: #{selected_item.gift_type} \nCost: #{selected_item.price}"
            edit_item = prompt.select("What would you like to edit about the item: #{selected_item.name}?", %w(Name Type Price))
            if edit_item == "Name"
                name_edit = prompt.ask("What would you like to change the name of #{selected_item.name} to?")
                selected_item.name = name_edit
                binding.pry
            elsif edit_item == "Type"
                type_edit = prompt.ask("What would you like to change the type of #{selected_item.name} to?")
                selected_item.type = type_edit
            elsif edit_item == "Price"
                price_edit = prompt.ask("What would you like to change the price of #{selected_item.name} to?", convert: :float)
                selected_item.price = price_edit
            end
        
        elsif v_a_e_c == "Add"
            puts "Here are a list of items you can add to the inventory of #{selected_store.name}:"
            selected_item = prompt.select("What item you like to add?") do | menu | 
                Gift.all.map do |s| 
                    menu.choice s.name, s
                end
            end
            GiftItem.create(store_id: selected_store.id, gift_id: selected_item.id)
            puts "#{selected_item.name} has been added to the iventory of #{selected_store.name}."
       
        elsif v_a_e_c == "Create"
            item_name = prompt.ask("What is the name of the item you are adding?")
            item_price = prompt.ask("What is the price of the #{item_name}?")
            item_type = prompt.ask("What type of item is the #{item_name}?")

            new_gift = Gift.create(name: item_name, price: item_price, gift_type: item_type)
            GiftItem.create(store_id: selected_store.id, gift_id: new_gift.id)
            puts "#{item_name} has been added to the iventory of #{selected_store.name}."
        end
        
        











    elsif v_o_c == "Create"
        store_name = prompt.ask("What is the name of the store you'd like to create?")
        store_type = prompt.ask("What type of store is #{store_name}?")

        new_store = Store.create(name: store_name, store_type: store_type)
        puts "Congratulations! #{store_name} has been opened!"
        
        a_o_c_items = prompt.select("Would you like to add or create items for the store?", %w(Add Create))
        #add or create items to store
        
        
        if a_o_c_items == "Add"
            puts "Here are a list of items you can add to the inventory of #{store_name}:"
            selected_item = prompt.select("What item you like to add?") do | menu | 
                Gift.all.map do |s| 
                    menu.choice s.name, s
                end
            end
            GiftItem.create(store_id: new_store.id, gift_id: selected_item.id)
            puts "#{selected_item.name} has been added to the iventory of #{store_name}."
       
        elsif a_o_c_items == "Create"
            item_name = prompt.ask("What is the name of the item you are adding?")
            item_price = prompt.ask("What is the price of the #{item_name}?")
            item_type = prompt.ask("What type of item is the #{item_name}?")

            new_gift = Gift.create(name: item_name, price: item_price, gift_type: item_type)
            GiftItem.create(store_id: new_store.id, gift_id: new_gift.id)
            puts "#{item_name} has been added to the iventory of #{store_name}."
        end
    end








elsif o_o_s == "Shopper"
    s_o_g = prompt.select("Are you looking for a store, or a gift?", %w(Store Gift))
    #store or gift
    
    if s_o_g == "Store"
        selected_store = prompt.select("What would you like to see?") do | menu | 
            Store.all.map do |s| 
                menu.choice s.name, s
            end
        end
        selected_item = prompt.select("These items are sold in #{selected_store.name} \nWhat item you like to view?") do | menu | 
            selected_store.gifts.map do |g| 
                menu.choice g.name, g
            end
        end

         puts "Selected item: #{selected_item.name} \nType: #{selected_item.gift_type} \nCost: #{selected_item.price}"
    
    elsif s_o_g == "Gift"
        puts "Here is a list of every item available:"
        selected_gift = prompt.select("Which item would you like to know about?") do | menu |
            Gift.all.map do |g|
                menu.choice g.name, g
            end
        end
        puts "Here is the information about #{selected_gift.name}: \nType: #{selected_gift.gift_type} \nCost: #{selected_gift.price} \nStores it can be found in: #{selected_gift.stores}"
    end
end

puts "END OF PROGRAM"