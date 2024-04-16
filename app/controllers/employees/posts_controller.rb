class Employees::PostsController < ApplicationController

  def new
    @store = Store.find(params[:store_id])
    @post = Post.new
  end
  
  def create
    @store = Store.find(params[:store_id])
    @post = Post.new(post_params)
    #byebug
    @post.employee_id = current_employee.id
    if @post.save!
      redirect_to store_posts_path(@store)
    else
      render :new
    end
  end

  def index
    @store = Store.find(params[:store_id])
    @posts = @store.posts
  end

  def show
    @post =Post.find(params[:id])
    @comment = Comment.new
    @store = @post.store
  end
 
  def edit
    @post =Post.find(params[:id])
  end
  
  def update
    @post =Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end
  
  def destroy
    @post =Post.find_by_id(params[:id])
    @post.destroy if @post #データを削除
    redirect_to posts_path #post indexページへ
  end
  
   private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:title, :body, :vendor_id, :genre, :store_id)
  end
end
