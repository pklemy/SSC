

class ApplicationController < ActionController::Base
  before_action :employeestore_admin, only: [:管理者のみが実行可能なアクション]


 private

 def store_admin
   unless current_employee.store_admin?
     redirect_to employees_top_path   #管理者以外が管理者のみ実行できるアクションを実行しようとしたときのリダイレクト先
   end
 end
end
