require_relative '../config/environment'

puts
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "} Welcome to your Holiday Shopping! {"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts
#welcome!

class Run
    def self.main_menu
        prompt = TTY::Prompt.new

        o_o_s = ShopperMenuChoice.main_menu
        #owner or shopper
        
        if o_o_s == "Owner"
            v_o_c = OwnerMenuChoice.owner
            #view, create, update stores/item  
            if v_o_c == "View"
                OwnerMenuChoice.view
            elsif v_o_c == "Create"
                OwnerMenuChoice.create
            elsif v_o_c == "Close"
                Store.close_store
                Run.main_menu
            elsif v_o_c == "Main Menu"
                main_menu
            elsif v_o_c == "Exit"
                exit
            end
        
        elsif o_o_s == "Shopper"
            s_o_g = ShopperMenuChoice.shopper
            #store or gift
            if s_o_g == "Store"
                ShopperMenuChoice.shopper_store_choice
            elsif s_o_g == "Gift"
                ShopperMenuChoice.shopper_gift_choice
            elsif s_o_g == "Main Menu"
                main_menu
            elsif s_o_g == "Exit"
                exit
            end
        elsif o_o_s == "Exit"
            exit
        end
    end
end

Run.main_menu