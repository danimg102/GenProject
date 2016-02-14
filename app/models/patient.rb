class Patient < ActiveRecord::Base
  belongs_to :system
  has_many :attvalues, dependent: :destroy
end
