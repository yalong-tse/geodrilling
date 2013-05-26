class Transferrecord < ActiveRecord::Base
  attr_accessible :borrowdate, :borrower, :devicenumber, :devicetype, :holenumber, :return, :returndate
end
