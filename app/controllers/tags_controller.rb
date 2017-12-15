class TagsController < ApplicationController

  before_action :destroy, only: [:index]

  def index
    @tags = Tag.group(:name)
  end

  def show
    @tag = Tag.find(params[:id])
    @tagname = Tag.find(params[:id]).name
    @tags = Tag.where(name: @tagname)

    @prototype_ids = []

    @tags.each do |tag|
      @prototype_ids += tag.prototypes
    end

    @prototypes = @prototype_ids
  end


  def create
    @tag = Tag.create(tag_params)
  end

  def update
    @tag.update(tag_params)
  end

  def destroy
    @tags = Tag.all
    @tags.each do |tag|
      if tag.name == ""
        tag.destroy
      end
    end
  end


  private
  def tag_params
    params.require(:tag).permit(:id, :name, { prototype_ids:[] })
  end

end
