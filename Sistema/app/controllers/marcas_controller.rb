class MarcasController < ApplicationController
  before_action :set_marca, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  

  # GET /marcas
  # GET /marcas.json
  def index
    @marcas = Marca.where("marca_active != false").order("marca_descrip ASC")

    if params[:marca_descrip].present?
        @marcas = @marcas.where("marca_descrip ILIKE ?", "%#{params[:marca_descrip]}%")
    end
  end

  # GET /marcas/1
  # GET /marcas/1.json
  def show
  end

  # GET /marcas/new
  def new
    @marca = Marca.new
  end

  # GET /marcas/1/edit
  def edit
  end

  # POST /marcas
  # POST /marcas.json
  def create
    @marca = Marca.new(marca_params)

    respond_to do |format|
      if @marca.save
        format.html { redirect_to action: "index"}
        format.json { render :show, status: :created, location: @marca }
      else
        format.html { render :new }
        format.json { render json: @marca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marcas/1
  # PATCH/PUT /marcas/1.json
  def update
    respond_to do |format|
      if @marca.update(marca_params)
        format.html { redirect_to action: "index"}
        format.json { render :show, status: :ok, location: @marca }
      else
        format.html { render :edit }
        format.json { render json: @marca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marcas/1
  # DELETE /marcas/1.json
  def destroy
    marca = Marca.find(params[:id])
    marca.update_attribute(:marca_active, false)
    redirect_to marcas_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marca
      @marca = Marca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marca_params
      params.require(:marca).permit(:marca_descrip, :marca_active)
    end
end
