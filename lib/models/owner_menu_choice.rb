ActiveRecord::Base.logger = nil
class OwnerMenuChoice < ActiveRecord::Base
    @@prompt = TTY::Prompt.new

    def self.owner
        @@prompt.select("Would you like to view the stores, create a new store, or close a store?") do | menu | 
            menu.choice "View", "View" 
            menu.choice "Create", "Create"
            menu.choice "Close", "Close"
            menu.choice "Main Menu", "Main Menu"
            menu.choice "Exit", "Exit"
        end
    end

    def self.view
        selected_store = Store.view_store
        
        v_a_e_c = @@prompt.select("\nYou have chosen #{selected_store.name}. \nWould you like to view the stores items, edit current items, create a new item, or remove an item?", %w(View Edit Add Create Remove))
        #view, add, edit, create items
        if v_a_e_c == "View"
            puts "\nThese items are sold in #{selected_store.name}"
            selected_item = Gift.view_item(selected_store)
            selected_item.item_info(selected_item)
            Run.main_menu
        
        elsif v_a_e_c == "Edit"
            puts "\nThese items are sold in #{selected_store.name}"
            selected_item = @@prompt.select("What item you like to edit?") do | menu | 
                selected_store.gifts.map do |g| 
                    menu.choice g.name, g
                end
            end

            Gift.edit_item(selected_item)
            Run.main_menu
        
        elsif v_a_e_c == "Add"
            Gift.add_to_inv(selected_store)
            Run.main_menu
       
        elsif v_a_e_c == "Create"
            Gift.create_item(selected_store)
            Run.main_menu

        elsif v_a_e_c == "Remove"
            Gift.remove_item(selected_store)
            Run.main_menu
        end
    end

    def self.create
        selected_store = Store.create_store
        a_o_c_items = @@prompt.select("\nWould you like to add or create items for the store?", %w(Add Create))
        #add or create items to store
        
        if a_o_c_items == "Add"
            Gift.add_to_inv(selected_store)
            Run.main_menu
       
        elsif a_o_c_items == "Create"
            Gift.create_item(selected_store)
            Run.main_menu
        end
    end
end