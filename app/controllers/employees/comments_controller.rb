class Employees::CommentsController < ApplicationController
    
  def create
    @post = Post.find(params[:post_id])
    @comment = current_employee.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "登録できました"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "登録に失敗しました"
      render "employees/posts/show"
    end
  end
  
  def destroy
    @comment = Comment.find_by_id(params[:id])
    @post = @comment.post
    @comment.destroy if @comment
    flash[:notice] = "削除しました"
    redirect_to post_path(@post)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
