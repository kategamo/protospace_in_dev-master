class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]

  def index
    @prototypes = Prototype.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: :new }), alert: 'New prototype was unsuccessfully created'
     end
  end

  def show
    set_prototype
    @comments =@prototype.comments.includes(:user)
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.user_id = current_user.id
      prototype.destroy
    end
  end

  def edit
    @capimg = @prototype.captured_images
    @capimg.each do |capimg|
     if capimg[:status]==0
      @main_thumb = capimg #capimgが配列に渡る
      end
    end
 @sub_thumb = @prototype.set_sub_thumbnail
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.user_id = current_user.id
      prototype.update(prototype_params)
      redirect_to ({ action: :show }), notice: 'Prototypes was successfully edited'
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status, :id]
    )
  end
end
