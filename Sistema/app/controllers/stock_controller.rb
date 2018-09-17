class StockController < ApplicationController
  before_action :authenticate_user!

  def index
  	@producto = Producto.all
  end
end
