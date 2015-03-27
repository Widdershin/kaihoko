class OrderGroceries
  def initialize(user)
    @user = user
  end

  def call
    countdown.login(user)
    countdown.add_items_to_cart(user)
    countdown.purchase!
  end

  private

  def countdown
    @countdown ||= CountdownApi.new
  end
end

