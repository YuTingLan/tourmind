class CommentsController < ApplicationController
  def index 
    if params[:keyword].present?
      @comments = Comment.where("author LIKE ?", "%#{params[:keyword]}%")
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
        @comment = Comment.find_by(id: params[:id])
      end
      def edit
        @comment = Comment.find_by(id: params[:id])
      end
    
      def update
        @comment = Comment.find_by(id: params[:id])
        if @comment.update(commemt_params)
            redirect_to comments_path, notice: '編輯成功'
        else 
            render :edit 
        end
      end
    
     def destroy 
      @comment = Comment.find_by(id: params[:id])
      @comment.destroy
        redirect_to comments_path
     end
    private 


  #   def find_comment
      # @comment = Comment.find(params[:resume_id])
  #   end

    def commemt_params 
      params.require(:comment).permit(:content,:title,:author,:rating, :image,images: [])
  end
  end
