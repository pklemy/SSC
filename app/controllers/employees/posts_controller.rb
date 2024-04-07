class Employees::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def create
    post = Post.new(post_params)
    #byebug
    post.employee_id = current_employee.id
    post.save
    redirect_to '/employees/posts'
  end

  def index
    @posts = Post.all
  end

  def show
    @post =Post.find(params[:id])
  end
 
  def edit
    @post =Post.find(params[:id])
  end
  def update
  end
  
  def destroy
  end
  
   private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
