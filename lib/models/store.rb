#creating a store class
ActiveRecord::Base.logger = nil
class Store < ActiveRecord::Base
    has_many :gift_items
    has_many :gifts, through: :gift_items

    @@prompt = TTY::Prompt.new

    def self.view_store
        selected_store = @@prompt.select("What store would you like to see?") do | menu | 
            Store.all.map do |s| 
                menu.choice s.name, s
            end
            menu.choice "Main Menu", "Main Menu"
            menu.choice "Exit", "Exit"
        end
        if selected_store == "Main Menu"
            Run.main_menu
        elsif selected_store == "Exit"
            exit
        else
            selected_store
        end
    end

    def self.close_store
        selected_store = @@prompt.select("Which store would you like to close?") do | menu | 
            Store.all.map do |s| 
                menu.choice s.name, s
            end
            menu.choice "Main Menu", "Main Menu"
            menu.choice "Exit", "Exit"
        end
        if selected_store == "Main Menu"
            Run.main_menu
        elsif selected_store == "Exit"
            exit
        else
            puts "#{selected_store.name} has been closed!"
            selected_store.gift_items.destroy
            selected_store.destroy
        end
    end

    def self.create_store
        store_name = @@prompt.ask("What is the name of the store you'd like to create?")
        store_type = @@prompt.ask("What type of store is #{store_name}?")

        selected_store = Store.create(name: store_name, store_type: store_type)
        puts "Congratulations! #{store_name} has been opened!"
        selected_store
    end
end