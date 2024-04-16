class Employees::VendorsController < ApplicationController
  def new
    @store = Store.find(params[:store_id])
    @vendor= Vendor.new
  end
  
  def create
    @store = Store.find(params[:store_id])
    vendor = Vendor.new(vendor_params)
    if vendor.save
      redirect_to store_vendors_path(@store)
    else
      render :new
    end
  end
  
  def index
    @store = Store.find(params[:store_id])
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @store = @vendor.store
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end
  
  def update
    @vendor = Vendor.find(params[:id])
    @store = @vendor.store
    if @vendor.update(vendor_params)
      redirect_to store_vendors_path(@store)
    else
      render :edit
    end
  end

  def destroy
    @vendor = Vendor.find_by_id(params[:id])
    @store = @vendor.store
    @vendor.destroy if @vendor
    redirect_to store_vendors_path(@store)
  end
  
    private
  # ストロングパラメータ
  def vendor_params
    params.require(:vendor).permit(:vendor_name, :url, :phone, :name, :store_id)
  end
end
