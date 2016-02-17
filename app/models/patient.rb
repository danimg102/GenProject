class Patient < ActiveRecord::Base
  #belongs_to :system
  has_many :attvalues, dependent: :destroy
  has_and_belongs_to_many :systems

  # This method returns an object 'Attvalue'
  def get_value_object_for_attribute(attr_id)
    return Attvalue.where(attrib_id:attr_id, patient_id:self.id)
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
      object = Attvalue.create(:attr_id => attr_id, :patient_id => self.id, :value => value)
    end
    object.save
    object
  end
end