class Equipment < ActiveRecord::Base
  attr_accessible :borrower, :category, :keeper, :name, :quantity, :usage
end
