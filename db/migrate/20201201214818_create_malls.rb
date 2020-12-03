class CreateMalls < ActiveRecord::Migration[6.0]
  def change
    create_table :malls do |t|
      t.string :name
      t.string :location
    end
  end
end

