class GiftItem < ActiveRecord::Base
    belongs_to :store
    belongs_to :gift
end