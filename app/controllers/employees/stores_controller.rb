class Employees::StoresController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_store, only: [:show, :edit, :update, :invitation]
  before_action :correct_member, only: [:show]
  before_action :store_admin_check, only: [:new, :create, :edit, :update, :destroy, :invitation]
  before_action :correct_admin, only: [:edit, :update, :destroy, :invitation]
  
  def new
    @store = Store.new
  end
  
  def create
    @store = current_employee.stores.build(store_params)
    if @store.save
      flash[:notice] = "登録できました"
      redirect_to root_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def index
    @stores = (current_employee.stores + current_employee.staff_stores).uniq
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @store.update(store_params)
      flash[:notice] = "変更できました"
      redirect_to stores_path
    else
      flash.now[:alert] = "変更に失敗しました"
      render :edit
    end
  end
  
  def invitation
    EmployeeMailer.with(store_hash: @store.store_hash, email: params[:email]).welcome_mail.deliver_now
    redirect_to store_path(@store)
  end
  
   private
  # ストロングパラメータ
  def store_params
    params.require(:store).permit(:name, :address, :phone)
  end
  
  def set_store
    @store = Store.find(params[:id])
  end
  
  def store_admin_check
    unless current_employee&.store_admin
      redirect_to root_url
    end
  end
  
  def correct_member
    unless @store.all_members.include?(current_employee)
      redirect_to root_url
    end
  end
  
  def correct_admin
    unless @store.employee == current_employee
      redirect_to root_url
    end
  end
end
