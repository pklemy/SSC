class Employees::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def create
    post = Post.new(post_params)
    #byebug
    post.employee_id = current_employee.id
    post.save
    redirect_to employees_posts_path
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
    @post =Post.find(params[:id])
    @post.update(post_params)
    redirect_to employees_post_path(@post.id)
  end
  
  def destroy
    @post =Post.find(params[:id])
    @post.destroy  #データを削除
    redirect_to employees_posts_path #post indexページへ
  end
  
   private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
