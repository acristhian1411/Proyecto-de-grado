class SubCategoriesController < ApplicationController
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  

  # GET /sub_categories
  # GET /sub_categories.json
  def index
    @sub_categories = SubCategory.where("sub_categ_active != false").order("sub_categ_descrip ASC")
    @category = Category.where("category_active != false")
    
    if params[:sub_categ_descrip].present?
        @sub_categories = @sub_categories.where("sub_categ_descrip ILIKE ?", "%#{params[:sub_categ_descrip]}%")
    end
  end

  # GET /sub_categories/1
  # GET /sub_categories/1.json
  def show
    @category = Category..where("category_active != false")
  end

  # GET /sub_categories/new
  def new
    @sub_category = SubCategory.new
    @category = Category.where("category_active != false")

  end

  # GET /sub_categories/1/edit
  def edit
    @category = Category.where("category_active != false")

  end

  # POST /sub_categories
  # POST /sub_categories.json
  def create
    @category = Category.where("category_active != false")
    @sub_category = SubCategory.new(sub_category_params)

    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to action: "index"}
        format.json { render :show, status: :created, location: @sub_category }
      else
        format.html { render :new }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_categories/1
  # PATCH/PUT /sub_categories/1.json
  def update
    @category = Category.where("category_active != false")
    respond_to do |format|
      if @sub_category.update(sub_category_params)
        format.html { redirect_to action: "index"}
        format.json { render :show, status: :ok, location: @sub_category }
      else
        format.html { render :edit }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_categories/1
  # DELETE /sub_categories/1.json
  def destroy
    sub_category = SubCategory.find(params[:id])
    sub_category.update_attribute(:sub_categ_active, false)
    redirect_to sub_categories_path
  end

  def subCateg_lst
    # se obtiene los datos necesarios del modelo 
    @sub_categories = SubCategory.select("id,sub_categ_descrip,category_id").where("category_id = ?", params[:category_id])
    # se define la salida en formato json 
    respond_to do |format|
    format.json { render :json => @sub_categories } # render convierte los datos de estado a el formato json
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_category
      @sub_category = SubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_category_params
      params.require(:sub_category).permit(:sub_categ_descrip, :sub_categ_active, :category_id)
    end
end
