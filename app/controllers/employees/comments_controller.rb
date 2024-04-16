class Employees::CommentsController < ApplicationController
    
  def create
    @post = Post.find(params[:post_id])
    @comment = current_employee.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render "employees/posts/show"
    end
  end
  
  def destroy
    @comment = Comment.find_by_id(params[:id])
    @post = @comment.post
    @comment.destroy if @comment
    redirect_to post_path(@post)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
