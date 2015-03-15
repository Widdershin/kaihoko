class ItemsController < ApplicationController
  before_action :authenticate_user!

  def list
    @items = current_user.items.in_shopping_list
  end

  def create
    item_json = JSON.parse(params[:item]).symbolize_keys

    current_user.items.in_shopping_list.create!(
      :name => item_json[:name],
      :price => item_json[:price],
      :image_url => item_json[:image_url],
      :purchased => false,
    )

    redirect_to action: :list
  end
end
