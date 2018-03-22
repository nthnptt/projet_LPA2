class Student < ActiveRecord::Base
  validates :name, :lastname, presence: true

end
