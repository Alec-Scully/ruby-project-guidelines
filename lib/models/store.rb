#creating a store class
class Store < ActiveRecord::Base
    has_many :gift_items
    has_many :gifts, through: :gift_items
end