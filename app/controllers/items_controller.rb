class ItemsController < ApplicationController
  before_action :authenticate_user!

  def list
    @items = current_user.items_in_shopping_list
  end
end
