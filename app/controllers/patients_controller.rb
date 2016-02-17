class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    param_system_id = params[:system_id]
    if param_system_id.nil?
      @patients = Patient.all
    else
      @patients = Patient.joins(:systems).where({ systems: { id: param_system_id } })
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    #@system_attributes = Attrib.where({system_id: @patient.system_id})
    #@patient_data = Attrib.joins("LEFT JOIN attvalues ON attribs.id = attvalues.attrib_id").where("attvalues.patient_id = #{@patient.id}")
    #@patient_data = Attrib.includes(:attvalues).where('attvalues.patient_id = ?', @patient.id).references(:attvalues)
    #TODO:Ver por que la consulta no me hace bien el LEFT JOIN
    #@patient_data = Attrib.find_by_sql("SELECT * FROM attribs LEFT OUTER JOIN attvalues ON attribs.id = attvalues.attrib_id
    #         WHERE attribs.system_id = #{@patient.system_id} AND attvalues.patient_id = #{@patient.id}")
    #@patient_data = Attrib.eager_load(:attvalues)
    #@patient_data = Attvalue.where({patient_id: @patient.id}).joins("as vals RIGHT JOIN attribs ON attribs.id = vals.attrib_id")
    @system_attributes = Attrib.where({system_id: params[:system_id]})
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    #@patient.system_id = params[:system_id]
    @system_attributes = Attrib.where({system_id: params[:system_id]})
  end

  # GET /patients/1/edit
  def edit
    #@system_attributes = Attrib.find_by_sql("SELECT * FROM attribs LEFT OUTER JOIN attvalues ON attribs.id = attvalues.attrib_id
    #         WHERE attribs.system_id = #{@patient.system_id} AND attvalues.patient_id = #{@patient.id}")
    #@system_attributes = Attrib.joins(:attvalues)
    #@system_attributes = @system_attributes.where(:system_id => @patient.system_id)
    #@system_attributes = @system_attributes.where(:patient_id => @patient.id)
    #@system_attributes = @system_attributes.order(:name)
    #@system_attributes = @system_attributes.where(:date = Time.now)
    @system = System.find(params[:system_id])
    @system_attributes = @system.attribs
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        @patient.set_attvalues(params)
        @patient.save_to_system(params[:system_id])
        format.html { redirect_to system_patients_path, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # Add an attvalue to the database
=begin
  def add_attvalue(patient, params, format)
    system_attributes = Attrib.where({system_id: patient.system_id})
    system_attributes.each do |sa|
      attvalue = params["#{sa.name}"]
      if attvalue != ""
          attvalue = Attvalue.new(attrib_id: sa.id, value: attvalue, patient_id: patient.id)
        if not attvalue.save
          format.html { render :new }
          format.json { render json: "Error saving attvalue: #{attvalue.value}", status: :unprocessable_entity }
        end
      end
    end
  end
=end

  # Update attvalues of the edited patient
=begin
  def update_attvalue(patient, params, format)
    system_attributes = Attrib.where({system_id: patient.system_id})
    system_attributes.each do |sa|
      #Attvalue.update
    end
  end
=end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        @patient.set_attvalues(params)
        format.html { redirect_to system_patient_path(@patient.get_system_id, @patient.id), notice: 'Patient was successfully updated.' }
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
