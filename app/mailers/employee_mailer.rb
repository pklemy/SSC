

class EmployeeMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  default from: "info@ssc.com"
  
  def welcome_mail
    @store = Store.find_by(store_hash: params[:store_hash])
    if @store
      @url = new_staff_path(@store.store_hash)
    end
    mail(to: params[:email], subject: "#{@store.name}より招待があります.")
  end
end
