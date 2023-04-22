class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  def index 
    if params[:keyword].present?
      @comments = Comment.by_content(params[:keyword])
    else
      @comments = Comment.all
    end
  end
    def new 
    @comment = Comment.new
    end
  def create 
    @comment = Comment.new(commemt_params)
    if @comment.save 
      redirect_to comments_path, notice: '新增成功'
    else 
      render :new 
    end
  end

  def show 
  end

  def edit
  end

  def update
    if @comment.update(commemt_params)
      redirect_to comments_path, notice: '編輯成功'
    else 
      render :edit 
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_path
  end
  private 
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def commemt_params 
      params.require(:comment).permit(:content,:title,:author,:rating, :image,images: [])
    end
end
