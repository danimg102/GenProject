class Patient < ActiveRecord::Base
  #belongs_to :system
  #has_systems#indexmany :attvalues, dependent: :destroy
  has_and_belongs_to_many :systems

  validates :code, numericality: {}, presence: true

  # This method returns an object 'Attvalue'
  def get_value_object_for_attribute(attr_id)
    return Attvalue.find_by(attrib_id:attr_id, patient_id:self.id)
  end

  def get_value_for_attribute(attr_id)
    get_value_object_for_attribute(attr_id).value
  rescue
    nil
  end

  def set_value_for_attribute(attr_id, value)
    object = get_value_object_for_attribute(attr_id)
    if object
      object.value = value
    else
      object = Attvalue.new(attrib_id: attr_id, patient_id: self.id, value: value)
    end
    object.save
  rescue
    'Could not save attvalue into table'
  end

  # This method returns the 'id' of the first System the patient belongs
  def get_system_id
    return System.joins(:patients).where({ patients: { id: self.id } }).first.id
  end

  # This method saves to the database the set of attributes and values received from 'params'
  # Used to "create" and "update" patient's attvalues
  def set_attvalues(params)
    system_attributes = Attrib.where({system_id: params[:system_id]})
    system_attributes.each do |sa|
      attvalue = params["#{sa.name}"]
      self.set_value_for_attribute(sa.id, attvalue)
    end
  end

  # Saves the current patient to the system which "id" is passed though param
  def save_to_system(system_id)
    system = System.find(system_id)
    system.patients<<self
  end

  def get_system_attributes(system_id)
    return Attrib.where({ system_id: system_id })
  rescue
    return nil
  end
end