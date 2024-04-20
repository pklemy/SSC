class Employees::VendorsController < ApplicationController

  def new
    @store = Store.find(params[:store_id])
    @vendor= Vendor.new
    correct_owner
  end
  
  def create
    @store = Store.find(params[:store_id])
    @vendor = Vendor.new(vendor_params)
    correct_owner
    if @vendor.save
      redirect_to store_vendors_path(@store)
    else
      render :new
    end
  end
  
  def index
    @store = Store.find(params[:store_id])
    @vendors = @store.vendors
    correct_staff
  end

  def show
    @vendor = Vendor.find(params[:id])
    @store = @vendor.store
    correct_staff
  end

  def edit
    @vendor = Vendor.find(params[:id])
    @store = @vendor.store
    correct_staff
  end
  
  def update
    @vendor = Vendor.find(params[:id])
    @store = @vendor.store
    correct_staff
    if @vendor.update(vendor_params)
      redirect_to store_vendors_path(@store)
    else
      render :edit
    end
  end

  def destroy
    @vendor = Vendor.find_by_id(params[:id])
    @store = @vendor.store
    correct_owner
    @vendor.destroy if @vendor
    redirect_to store_vendors_path(@store)
  end
  
    private
  # ストロングパラメータ
  def vendor_params
    params.require(:vendor).permit(:vendor_name, :url, :phone, :name, :store_id)
  end
  
  def correct_staff
    if !(@store.all_members).include?(current_employee)
      redirect_to root_url
    end
  end
  
  def correct_owner
    if @store.employee != current_employee
      redirect_to root_url
    end
  end
end
