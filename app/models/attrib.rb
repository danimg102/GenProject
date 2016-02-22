class Attrib < ActiveRecord::Base
  belongs_to :system
  has_many :attvalues, dependent: :destroy

  validates :name, :attr_type, numericality: {}, presence: true

  enum attr_type: %i(string text integer float date nomenclator)

  def get_attrib_system_name(system_id)
    return System.find_by(id:system_id).name
  end
end
