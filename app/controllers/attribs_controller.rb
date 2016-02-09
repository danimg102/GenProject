class AttribsController < ApplicationController
  before_action :set_attrib, only: [:show, :edit, :update, :destroy]

  # GET /attribs
  # GET /attribs.json
  def index
    @attribs = Attrib.all
  end

  # GET /attribs/1
  # GET /attribs/1.json
  def show
  end

  # GET /attribs/new
  def new
    @attrib = Attrib.new
  end

  # GET /attribs/1/edit
  def edit
  end

  # POST /attribs
  # POST /attribs.json
  def create
    @attrib = Attrib.new(attrib_params)

    respond_to do |format|
      if @attrib.save
        format.html { redirect_to @attrib, notice: 'Attrib was successfully created.' }
        format.json { render :show, status: :created, location: @attrib }
      else
        format.html { render :new }
        format.json { render json: @attrib.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attribs/1
  # PATCH/PUT /attribs/1.json
  def update
    respond_to do |format|
      if @attrib.update(attrib_params)
        format.html { redirect_to @attrib, notice: 'Attrib was successfully updated.' }
        format.json { render :show, status: :ok, location: @attrib }
      else
        format.html { render :edit }
        format.json { render json: @attrib.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attribs/1
  # DELETE /attribs/1.json
  def destroy
    @attrib.destroy
    respond_to do |format|
      format.html { redirect_to attribs_url, notice: 'Attrib was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attrib
      @attrib = Attrib.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attrib_params
      params.require(:attrib).permit(:system_id, :name, :type, :extra)
    end
end
