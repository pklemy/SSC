class Employees::VendorsController < ApplicationController
  def new
    @vendor= Vendor.new
  end
  
  def create
    vendor = Vendor.new(vendor_params)
    vendor.save
    redirect_to employees_vendors_path
  end
  
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(store: params[:id])
  end

  def edit
    @vendor = Vendor.find(store: params[:id])
  end
  
  def update
    @vendor = Vendor.find(store: params[:id])
    @vendor.update(store_params)
    redirect_to employees_vendors_path
  end

  def destroy
  end
  
    private
  # ストロングパラメータ
  def vendor_params
    params.require(:vendor).permit(:vendor_name, :url, :phone, :name,:store_id)
  end
end
