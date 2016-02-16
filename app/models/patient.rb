class Patient < ActiveRecord::Base
  belongs_to :system
  has_many :attvalues, dependent: :destroy
  has_and_belongs_to_many :systems

  def get_value_object_for_attribute(attr_id)
    # este devuelve un objeto attr_value
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
      object = AttValue.create(:attr_id => attr_id, :patient_id => self.id, :value =>fire value)
    end
    object.save
    object
  end
end