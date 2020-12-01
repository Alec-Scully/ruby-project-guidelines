class CreateStores < ActiveRecord::Migration[4.2]
    def change 
        create_table :stores do |t|
            t.string :name
            t.string :store_type
        end
    end
end