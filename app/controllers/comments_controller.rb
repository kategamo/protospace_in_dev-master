class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @comment = Comment.create(content: comment_params[:content], prototype_id: comment_params[:prototype_id],user_id: current_user.id)
    @prototype = Prototype.find(params[:prototype_id])
  end

  def show
  end

  def edit
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.update(comment_params)
    end
    redirect_to prototype_path(@comment.prototype.id), notice: 'Your commen was succesfully edited'
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy
    end
    @prototype = Prototype.find(params[:prototype_id])
  end

  private
  def comment_params
    params.permit(:id, :prototype_id,:content)
  end

  def find_comment
    @comment = Prototype.find(params[:prototype_id])
  end

end
