class CreateGiftItems < ActiveRecord::Migration[4.2]
    def change
        create_table :gift_items do |t|
            t.integer :store_id
            t.integer :gift_id
        end
    end
end