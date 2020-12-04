require_relative '../config/environment'

puts "HELLO WORLD"

puts
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "} Welcome to your Holiday Shopping! {"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts

prompt = TTY::Prompt.new

o_o_s = prompt.select("Are you a store owner or a shopper?", %w(Owner Shopper))
#owner or shopper

if o_o_s == "Owner"
    v_o_c = prompt.select("Would you like to view the stores, create a new store, or close a store?", %w(View Create Close))
    #view, create, update stores/item
    
    if v_o_c == "View"
        selected_store = Store.view_store
        
        v_a_e_c = prompt.select("You have chosen #{selected_store.name}. Would you like to view the stores items, edit current items, create a new item, or remove an item?", %w(View Edit Add Create Remove))
        #view, add, edit, create items
        if v_a_e_c == "View"
            puts "These items are sold in #{selected_store.name}"
            selected_item = Gift.view_item(selected_store)
            selected_item.item_info(selected_item)
        
        elsif v_a_e_c == "Edit"
            puts "These items are sold in #{selected_store.name}"
            selected_item = prompt.select("What item you like to edit?") do | menu | 
                selected_store.gifts.map do |g| 
                    menu.choice g.name, g
                end
            end

            Gift.edit_item(selected_item)
        
        elsif v_a_e_c == "Add"
            Gift.add_to_inv(selected_store)
       
        elsif v_a_e_c == "Create"
            Gift.create_item(selected_store)

        elsif v_a_e_c == "Remove"
            Gift.remove_item(selected_store)
        end

    elsif v_o_c == "Create"
        selected_store = Store.create_store
        a_o_c_items = prompt.select("Would you like to add or create items for the store?", %w(Add Create))
        #add or create items to store
        
        
        if a_o_c_items == "Add"
            Gift.add_to_inv(selected_store)
       
        elsif a_o_c_items == "Create"
            Gift.create_item(selected_store)
        end

    elsif v_o_c == "Close"
        Store.close_store
    end

elsif o_o_s == "Shopper"
    s_o_g = prompt.select("Are you looking for a store, or a gift?", %w(Store Gift))
    #store or gift
    
    if s_o_g == "Store"
        selected_store = Store.view_store

        puts "\nThese items are sold in #{selected_store.name}"
        selected_item = Gift.view_item(selected_store)
            selected_item.item_info(selected_item)
    
    elsif s_o_g == "Gift"
        puts "\nHere is a list of every item available:"
        selected_item = prompt.select("Which item would you like to view?") do | menu |
            Gift.all.map do |g|
                menu.choice g.name, g
            end
            # menu.choice Back, s_o_g
        end
        selected_item.item_info(selected_item)
    end
end

puts "END OF PROGRAM"