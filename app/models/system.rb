class System < ActiveRecord::Base
  has_many :attribs, dependent:  :destroy
  has_many :patients, dependent: :destroy
end
