class CreateGifts < ActiveRecord::Migration[4.2]
    def change
        create_table :gifts do |t|
            t.string :name
            t.float :price
            t.string :type
        end
    end
end