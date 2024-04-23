class Employees::EmployeesController < ApplicationController
  before_action :uniq_email_check, only: [:staff_create]
  def show
    @employee = Employee.find(params[:id])
  end
  
  def invite_session_new
    @employee = Employee.new(email: params[:email])
    @store = Store.find(params[:store_id])
  end
  
  def invite_session_create
    @store = Store.find(params[:store_id])
    @employee = Employee.find_by(email: params.dig(:employee, :email))
    if @employee.valid_password?(params.dig(:employee, :password))
      @employee.employee_stores.find_or_create_by(store_id: @store.id)
      sign_in @employee
      flash[:notice] = "店舗の招待を承認しました"
      redirect_to store_path(@store)
    else
      flash.now[:alert] = "パスワどが一致しません."
      render :invite_session_new
    end
  end
  
  def staff_new
    sign_out current_employee
    @store = Store.find_by(store_hash: params[:store_hash])
    @employee = Employee.new
  end
  
  def staff_create
    @employee = Employee.new(employee_params)
    if @employee.save
      @employee.employee_stores.find_or_create_by(store_id: @store.id)
      flash[:notice] = "登録できました"
      redirect_to root_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render :staff_new
    end
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end
  
  def update
     @employee = Employee.find(params[:id])
    if @employee.update (employee.params)
      flash[:notice] = "変更できました"
      redirect_to employee_path(@employee)
    else
      flash.now[:alert] = "変更できませんでした"
      render :edit
    end
  end
  
  def destroy
    @store = Store.find(params[:store_id])
    @employee = Employee.find_by_id(params[:id])
    @employee.destroy if @employee
    flash[:success] = "従業員を削除しました"
    redirect_to store_path(@store)
  end
  
  def guest_login
    @employee = Employee.find_or_initialize_by(email: "owner_1@test.com")
    if @employee.new_record?
      @employee.assign_attributes(id: 1, name: "ownew", password: "password", store_admin: true, phone_number: "000-000-0000")
      @employee.save!
    end
    sign_in @employee
    redirect_to root_url
  end
  
  private
  
  def employee_params
    params.require(:employee).permit(:name, :email, :phone_number, :password, :password_confirmation)
  end
  
  def uniq_email_check
    @store = Store.find(params[:store_id])
    @employee = Employee.find_by(email: params.dig(:employee, :email))
    if @employee&.store_admin?
      flash.now[:alert] = "店舗の管理者のアドレスです.他のアドレスを使用してください."
      @employee = Employee.new
      @employee.errors.add(:base, "管理者のアドレスは使用できません.")
      render :staff_new
    elsif @employee
      flash[:alert] = "メルアドレスはすでに登録済みです.店舗からの招待を受けるにはログインしてください."
      redirect_to new_invite_session_path(@store, email: @employee.email)
    end
  end
end
