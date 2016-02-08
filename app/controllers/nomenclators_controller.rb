class NomenclatorsController < ApplicationController
  before_action :set_nomenclator, only: [:show, :edit, :update, :destroy]

  # GET /nomenclators
  # GET /nomenclators.json
  def index
    @nomenclators = Nomenclator.all
  end

  # GET /nomenclators/1
  # GET /nomenclators/1.json
  def show
  end

  # GET /nomenclators/new
  def new
    @nomenclator = Nomenclator.new
  end

  # GET /nomenclators/1/edit
  def edit
  end

  # POST /nomenclators
  # POST /nomenclators.json
  def create
    @nomenclator = Nomenclator.new(nomenclator_params)

    respond_to do |format|
      if @nomenclator.save
        format.html { redirect_to @nomenclator, notice: 'Nomenclator was successfully created.' }
        format.json { render :show, status: :created, location: @nomenclator }
      else
        format.html { render :new }
        format.json { render json: @nomenclator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nomenclators/1
  # PATCH/PUT /nomenclators/1.json
  def update
    respond_to do |format|
      if @nomenclator.update(nomenclator_params)
        format.html { redirect_to @nomenclator, notice: 'Nomenclator was successfully updated.' }
        format.json { render :show, status: :ok, location: @nomenclator }
      else
        format.html { render :edit }
        format.json { render json: @nomenclator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nomenclators/1
  # DELETE /nomenclators/1.json
  def destroy
    @nomenclator.destroy
    respond_to do |format|
      format.html { redirect_to nomenclators_url, notice: 'Nomenclator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nomenclator
      @nomenclator = Nomenclator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nomenclator_params
      params.require(:nomenclator).permit(:name, :description)
    end
end
