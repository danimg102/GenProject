class Item < ActiveRecord::Base
  belongs_to :nomenclator
  validates :nomenclator_id, :value, presence: true
end
