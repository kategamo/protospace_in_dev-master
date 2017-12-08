class CommentsController < ApplicationController
  def create
    if user_signed_in?
    @comment= Comment.create(user_id:current_user.id, prototype_id:comment_params[:prototype_id], content:comment_params[:content])
    redirect_to "/prototypes/#{@comment.prototype_id}"
  else
    redirect_to "/users/sign_in"
  end
end

  def edit
    @prototype = Prototype.find(comment_params[:prototype_id])
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.user_id = current_user.id
      comment.update(comment_params)
      redirect_to :root , notice: 'Your comment was successfully edited'
    end
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
