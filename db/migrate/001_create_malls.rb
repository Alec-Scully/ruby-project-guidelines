class CreateMalls < ActiveRecord::Migration[4.2]
    def change
        create_table :malls do |t|
            t.string :name
            t.string :location
        end
    end
end