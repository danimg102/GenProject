class System < ActiveRecord::Base
  has_many :attribs, dependent:  :destroy

end
