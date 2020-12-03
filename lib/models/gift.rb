#creating a gift class
class Gift < ActiveRecord::Base
    has_many :gift_items
    has_many :stores, through: :gift_items
end