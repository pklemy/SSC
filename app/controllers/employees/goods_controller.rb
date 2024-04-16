class Employees::GoodsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_employee.good(@post)
    redirect_back(fallback_location: root_url)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    current_employee.ungood(@post)
    redirect_back(fallback_location: root_url)
  end
end
