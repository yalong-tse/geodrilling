class Appsetting < ActiveRecord::Base
  attr_accessible :name, :type, :value
end
