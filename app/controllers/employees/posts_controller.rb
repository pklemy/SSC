class Employees::PostsController < ApplicationController

  def new
    @store = Store.find(params[:store_id])
    @post = Post.new
  end
  
  def create
    @store = Store.find(params[:store_id])
    @post = Post.new(post_params)
    @post.employee_id = current_employee.id
    if @post.save
      flash[:notice] = "投稿に成功しました."
      redirect_to store_posts_path(@store)
    else
      flash.now[:alert] = "失敗しました."
      render :new
    end
  end

  def index
    @store = Store.find(params[:store_id])
    @posts = @store.posts
    @posts = @posts.where(genre: params[:genre]) if params[:genre].present?
    @posts = @posts.where("title Like ?", "%#{params[:keyword]}%").or(@posts.where("body Like ?", "%#{params[:keyword]}%")) if params[:keyword].present?
  end

  def show
    @post =Post.find(params[:id])
    @comment = Comment.new
    @store = @post.store
  end
 
  def edit
    @post =Post.find(params[:id])
    @store = @post.store
  end
  
  def update
    @post = Post.find(params[:id])
    @store = @post.store
    if @post.update(post_params)
      flash[:notice] = "変更しました."
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "失敗しました."
      render :edit
    end
  end
  
  def destroy
    @post =Post.find_by_id(params[:id])
    @post.destroy if @post #データを削除
    flash[:notice] = "削除されました."
    redirect_back(fallback_location: root_url) #post indexページへ
  end
  
   private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:title, :body, :vendor_id, :genre, :store_id)
  end
end
