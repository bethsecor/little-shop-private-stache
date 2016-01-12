class CartsController < ApplicationController
  def show
    @staches = @cart.staches
  end
end
