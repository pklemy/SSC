class Employees::EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
  end
  
  def staff_new
    sign_out current_employee
    @store = Store.find_by(store_hash: params[:store_hash])
    @employee = Employee.new
  end
  
  def staff_create
    @store = Store.find(params[:store_id])
    @employee = Employee.find_or_initialize_by(email: params.dig(:employee, :email))
    @employee.assign_attributes(employee_params)
    if @employee.save
      @employee.employee_stores.find_or_create_by(store_id: @store.id)
      redirect_to root_path
    else
      render :staff_new
    end
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(params[:id])
  end
  
  private
  
  def employee_params
    params.require(:employee).permit(:name, :email, :phone_number, :password, :password_confirmation)
  end
end
