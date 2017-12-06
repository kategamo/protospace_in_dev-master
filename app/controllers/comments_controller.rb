class CommentsController < ApplicationController
  def create
    @comment= Comment.create(user_id:current_user.id, prototype_id:comment_params[:prototype_id], content:comment_params[:content])
    redirect_to "/prototypes/#{@comment.prototype_id}"
  end

  def destroy
    comment= Comment.find(params[:id])
  if comment.user_id = current_user.id
      comment.destroy
  end
      redirect_to :root, notice: 'Comment was successfully deleted'
  end

  private
  def comment_params
    params.permit(:prototype_id,:content,:id)
  end

end
