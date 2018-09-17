class SucursalesController < ApplicationController
  before_action :set_sucursale, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  

  # GET /sucursales
  # GET /sucursales.json
  def index
    @sucursales = Sucursale.where("suc_activo != false").order("suc_descrip ASC")

    if params[:suc_descrip].present?
        @sucursales = @sucursales.where("suc_descrip ILIKE ?", "%#{params[:suc_descrip]}%")
    end
  end

  # GET /sucursales/1
  # GET /sucursales/1.json
  def show
  end

  # GET /sucursales/new
  def new
    @sucursale = Sucursale.new
  end

  # GET /sucursales/1/edit
  def edit
  end

  # POST /sucursales
  # POST /sucursales.json
  def create
    @sucursale = Sucursale.new(sucursale_params)

    respond_to do |format|
      if @sucursale.save
        format.html { redirect_to action: "index"}
        format.json { render :show, status: :created, location: @sucursale }
      else
        format.html { render :new }
        format.json { render json: @sucursale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sucursales/1
  # PATCH/PUT /sucursales/1.json
  def update
    respond_to do |format|
      if @sucursale.update(sucursale_params)
        format.html { redirect_to action: "index"}
        format.json { render :show, status: :ok, location: @sucursale }
      else
        format.html { render :edit }
        format.json { render json: @sucursale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sucursales/1
  # DELETE /sucursales/1.json
  def destroy
    sucursale = Sucursale.find(params[:id])
    sucursale.update_attribute(:suc_activo, false)
    redirect_to sucursales_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sucursale
      @sucursale = Sucursale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sucursale_params
      params.require(:sucursale).permit(:suc_descrip, :suc_activo)
    end
end
