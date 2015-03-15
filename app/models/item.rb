class Item < ActiveRecord::Base
  scope :in_shopping_list, -> { where.not(:user_id => nil).where(:purchased => false) }
end
