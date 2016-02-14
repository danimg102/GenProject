class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    #@system_attributes = Attrib.where({system_id: @patient.system_id})
    #@patient_data = Attrib.joins("LEFT JOIN genetics_development.`values` ON attribs.id = genetics_development.`values`.attrib_id").where("genetics_development.`values`.patient_id = #{@patient.id}")
    #@patient_data = Attrib.includes(:values).where('values.patient_id = ?', @patient.id).references(:values)
    #TODO:Ver por que la consulta no me hace bien el LEFT JOIN
    # @patient_data = Attrib.find_by_sql("SELECT * FROM attribs LEFT OUTER JOIN attvalues ON attribs.id = attvalues.attrib_id
    #          WHERE attribs.system_id = #{@patient.system_id} AND attvalues.patient_id = #{@patient.id}")
    @patient_data = Attrib.eager_load(:attvalues)
    #@patient_data = Attvalue.where({patient_id: @patient.id}).joins("as vals RIGHT JOIN attribs ON attribs.id = vals.attrib_id")
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    @patient.system_id = params[:system_id]
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to system_patients_path, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to system_patient_path(@patient.system_id, @patient.id), notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to system_patients_path, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:system_id, :code)
    end
end
