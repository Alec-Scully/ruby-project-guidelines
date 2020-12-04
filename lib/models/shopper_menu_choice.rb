
ActiveRecord::Base.logger = nil

class ShopperMenuChoice < ActiveRecord::Base
    @@prompt = TTY::Prompt.new

    def self.main_menu
        o_o_s = @@prompt.select("Are you a store owner or a shopper?", %w(Owner Shopper Exit))
    end

    def self.shopper 
        s_o_g = @@prompt.select("Are you looking for a store, or a gift?") do | menu |
            menu.choice "Store", "Store"
            menu.choice "Gift", "Gift"
            menu.choice "Main Menu", "Main Menu"
            menu.choice "Exit", "Exit"
        end
    end

    def self.shopper_store_choice
        selected_store = Store.view_store

        puts "\nThese items are sold in #{selected_store.name}"
        selected_item = Gift.view_item(selected_store)
        selected_item.item_info(selected_item)

        b_o_e = @@prompt.select("Would you like to go Main Menu or exit?") do | menu |
            menu.choice "Main Menu", "Main Menu"
            menu.choice "Exit", "Exit"
        end
        if b_o_e == "Main Menu"
            Run.main_menu
        elsif b_o_e == "Exit"
            exit
        end
    end

    def self.shopper_gift_choice
        puts "\nHere is a list of every item available:"
        selected_item = @@prompt.select("Which item would you like to view?") do | menu |
            Gift.all.map do |g|
                menu.choice g.name, g
            end
            menu.choice "Main Menu", "Main Menu"
            menu.choice "Exit", "Exit"
        end
        
        if selected_item == "Main Menu"
            Run.main_menu
        elsif selected_item == "Exit"
            exit
        else
            selected_item.item_info(selected_item)
        end
        b_o_e = @@prompt.select("Would you like to go Main Menu or exit?") do | menu |
            menu.choice "Main Menu", "Main Menu"
            menu.choice "Exit", "Exit"
        end
        if b_o_e == "Main Menu"
            Run.main_menu
        elsif b_o_e == "Exit"
            exit
        end
    end

    # def self.back_or_exit
    #     b_o_e = @@prompt.select("Would you like to go back or exit?") do | menu |
    #         menu.choice "Back", "Back"
    #         menu.choice "Exit", "Exit"
    #     end
    #     if b_o_e == "Back"
    #         self.previous_menu
    #     elsif b_o_e == "Exit"
    #         exit
    #     end
    # end
end