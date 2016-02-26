class Attrib < ActiveRecord::Base
  belongs_to :system
  has_many :attvalues, dependent: :destroy

  ATTR_TYPES = %w(string text integer float date datetime time nomenclator)

  validates :name, presence: true
  #validates_numericality_of :attr_type
  #validates_format_of :attr_type
  validates :attr_type, inclusion: ATTR_TYPES

  enum attr_type: %i(string text integer float date datetime time nomenclator)

  def get_attrib_system_name(system_id)
    return System.find_by(id:system_id).name
  end
end
