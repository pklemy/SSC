class Admins::EmployeesController < ApplicationController
  def destroy
    @employee = Employee.find_by_id(params[:id])
    @employee.destroy if @employee
    flash[:success] = "店舗管理者を削除しました"
    redirect_to admins_root_url
  end
end
