class Item < ActiveRecord::Base
  belongs_to :nomenclator
  validates :nomenclator_id, :value, presence: true

  def get_nomenclator_name(nomenclator_id)
    return Nomenclator.find_by(id: nomenclator_id).name
  end
end
