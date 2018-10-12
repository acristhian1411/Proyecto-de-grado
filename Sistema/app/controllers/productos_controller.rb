class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  

  # GET /productos
  # GET /productos.json
  def index
    @productos = Producto.where("prod_active != false").order("prod_descrip ASC")
# inicio buscador
    if params[:prod_descrip].present?
        @productos = @productos.where("prod_descrip ILIKE ?", "%#{params[:prod_descrip]}%")
    end
# fin buscador

    @marcas = Marca.where("marca_active != false").order("marca_descrip ASC")
    @categories = Category.where("category_active != false").order("category_descrip ASC")
    @sub_categories = SubCategory.where("sub_categ_active != false").order("sub_categ_descrip ASC")
    @proveedores = Proveedore.where("prov_activo != false").order("razon_social ASC")


  end

  # GET /productos/1
  # GET /productos/1.json
  def show
    @marcas = Marca.where("marca_active != false").order("marca_descrip ASC")
    @categories = Category.where("category_active != false").order("category_descrip ASC")
    @sub_categories = SubCategory.where("sub_categ_active != false").order("sub_categ_descrip ASC")
    @proveedores = Proveedore.where("prov_activo != false").order("razon_social ASC")

    @stock = Stock.where("producto_id = ?", params[:producto_id])

  end

  # GET /productos/new
  def new
    @producto = Producto.new
    @marcas = Marca.where("marca_active != false").order("marca_descrip ASC")
    @categories = Category.where("category_active != false").order("category_descrip ASC")
    @sub_categories = SubCategory.where("sub_categ_active != false").order("sub_categ_descrip ASC")
    @proveedores = Proveedore.where("prov_activo != false").order("razon_social ASC")
  end

  # GET /productos/1/edit
  def edit
    @marcas = Marca.where("marca_active != false").order("marca_descrip ASC")
    @categories = Category.where("category_active != false").order("category_descrip ASC")
    @sub_categories = SubCategory.where("sub_categ_active != false").order("sub_categ_descrip ASC")
    @proveedores = Proveedore.where("prov_activo != false").order("razon_social ASC")
  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = Producto.new(producto_params)
    @marcas = Marca.where("marca_active != false").order("marca_descrip ASC")
    @categories = Category.where("category_active != false").order("category_descrip ASC")
    @sub_categories = SubCategory.where("sub_categ_active != false").order("sub_categ_descrip ASC")
    @proveedores = Proveedore.where("prov_activo != false").order("razon_social ASC")
    respond_to do |format|
      if @producto.save
        format.html { redirect_to action: "index"}
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    @marcas = Marca.where("marca_active != false").order("marca_descrip ASC")
    @categories = Category.where("category_active != false").order("category_descrip ASC")
    @sub_categories = SubCategory.where("sub_categ_active != false").order("sub_categ_descrip ASC")
    @proveedores = Proveedore.where("prov_activo != false").order("razon_social ASC")
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to action: "index"}
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    producto = Producto.find(params[:id])
    producto.update_attribute(:prod_active, false)
    redirect_to productos_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producto_params
      params.require(:producto).permit(:prod_descrip, :iva, :prod_active, :proveedore_id, :marca_id, :sub_category_id)
    end
end
