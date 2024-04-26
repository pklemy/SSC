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
      flash[:notice] = "登録に成功しました."
      redirect_to store_vendors_path(@store)
    else
      flash[:alert] = "登録できませんでした."
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
      flash[:notice] = "変更しました."
      redirect_to store_vendors_path(@store)
    else
      flash[:alert] = "失敗しました."
      render :edit
    end
  end

  def destroy
    @vendor = Vendor.find_by_id(params[:id])
    @store = @vendor.store
    correct_owner
    @vendor.destroy if @vendor
    flash[:notice] = "削除されました."
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
