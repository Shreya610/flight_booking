class Passenger < ActiveRecord::Base
  belongs_to :user
  belongs_to :flight 
end
