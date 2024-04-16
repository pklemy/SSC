class Employees::StoresController < ApplicationController
  before_action :store_admin_check
  before_action :set_store, only: [:show, :edit, :update]
  
  def new
    @store = Store.new
  end
  
  def create
    @store = current_employee.stores.build(store_params)
    if @store.save
      redirect_to stores_path
    else
      render :new
    end
  end

  def index
    @stores = current_employee.stores
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @store.update(store_params)
    redirect_to stores_path
  end
  
  def invitation
    @store = Store.find(params[:id])
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
  
  def correct_employee
    unless current_employee == @store.employee
      redirect_to root_url
    end
  end
end
