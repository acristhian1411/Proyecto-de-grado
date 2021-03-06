class BarriosController < ApplicationController
  before_action :set_barrio, only: [:show, :edit, :update, :destroy]

  # GET /barrios
  # GET /barrios.json
  def index
    @barrios = Barrio.all
  end

  # GET /barrios/1
  # GET /barrios/1.json
  def show
  end

  # GET /barrios/new
  def new
    @barrio = Barrio.new
  end

  # GET /barrios/1/edit
  def edit
  end

  # POST /barrios
  # POST /barrios.json
  def create
    @barrio = Barrio.new(barrio_params)

    respond_to do |format|
      if @barrio.save
        format.html { redirect_to @barrio, notice: 'Barrio was successfully created.' }
        format.json { render :show, status: :created, location: @barrio }
      else
        format.html { render :new }
        format.json { render json: @barrio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barrios/1
  # PATCH/PUT /barrios/1.json
  def update
    respond_to do |format|
      if @barrio.update(barrio_params)
        format.html { redirect_to @barrio, notice: 'Barrio was successfully updated.' }
        format.json { render :show, status: :ok, location: @barrio }
      else
        format.html { render :edit }
        format.json { render json: @barrio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barrios/1
  # DELETE /barrios/1.json
  def destroy
    @barrio.destroy
    respond_to do |format|
      format.html { redirect_to barrios_url, notice: 'Barrio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barrio
      @barrio = Barrio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barrio_params
      params.require(:barrio).permit(:descripcion, :activo)
    end
end
