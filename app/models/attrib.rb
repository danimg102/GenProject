class Attrib < ActiveRecord::Base
  belongs_to :system
  has_many :attvalues, dependent: :destroy

  validates :name, :attr_type, presence: true
end
