class StockController < ApplicationController
  before_action :authenticate_user!

  def index
    @productos = Producto.where("prod_active != false").order("prod_descrip ASC")
    @sucursales = Sucursale.where("suc_activo != false").order("suc_descrip ASC")
    @stock = Stock.all	
  end
end
