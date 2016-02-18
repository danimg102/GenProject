class Attvalue < ActiveRecord::Base
  belongs_to :attrib
  belongs_to :patient

  validates :value, :attrib_id, :patient_id, presence: true
end
