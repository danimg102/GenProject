class AttvaluesController < ApplicationController
  before_action :set_value, only: [:show, :edit, :update, :destroy]

  # GET /attvalues
  # GET /attvalues.json
  def index
    @values = Attvalue.all
  end

  # GET /attvalues/1
  # GET /attvalues/1.json
  def show
  end

  # GET /attvalues/new
  def new
    @value = Attvalue.new
  end

  # GET /attvalues/1/edit
  def edit
  end

  # POST /attvalues
  # POST /attvalues.json
  def create
    @value = Attvalue.new(value_params)

    respond_to do |format|
      if @value.save
        format.html { redirect_to @value, notice: 'Attvalue was successfully created.' }
        format.json { render :show, status: :created, location: @value }
      else
        format.html { render :new }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attvalues/1
  # PATCH/PUT /attvalues/1.json
  def update
    respond_to do |format|
      if @value.update(value_params)
        format.html { redirect_to @value, notice: 'Attvalue was successfully updated.' }
        format.json { render :show, status: :ok, location: @value }
      else
        format.html { render :edit }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attvalues/1
  # DELETE /attvalues/1.json
  def destroy
    @value.destroy
    respond_to do |format|
      format.html { redirect_to values_url, notice: 'Attvalue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_value
      @value = Attvalue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def value_params
      params.require(:value).permit(:attrib_id, :value, :patient_id)
    end
end
