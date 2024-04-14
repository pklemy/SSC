class Employees::StoresController < ApplicationController
  
  def new
    @store = Store.new
  end
  
  def create
    store = Store.new(store_params)
    store.employee_id = current_employee.id
    store.save
    redirect_to employees_stores_path
  end

  
  def index
    @stores = Store.all
  end
  
  def show
   @store = Store.find(params[:id])
  end
  
  def edit
   @store = Store.find(params[:id])
  end
  
  def update
    @store = Store.find(params[:id])
    @store.update(store_params)
    redirect_to employees_stores_path
  end
  
   private
  # ストロングパラメータ
  def store_params
    params.require(:store).permit(:name, :address, :phone)
  end
end
