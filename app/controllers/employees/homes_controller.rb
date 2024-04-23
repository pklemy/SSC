class Employees::HomesController < ApplicationController
  
  def top
    @stores = (current_employee.stores + current_employee.staff_stores).uniq if current_employee
  end
  
  def about
  end
end
