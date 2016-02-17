class Attvalue < ActiveRecord::Base
  belongs_to :attrib
  belongs_to :patient

end
