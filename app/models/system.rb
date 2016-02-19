class System < ActiveRecord::Base
  has_many :attribs, dependent:  :destroy
  has_and_belongs_to_many :patients

  validates :name, presence: true
end
