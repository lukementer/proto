class CommentsController < ApplicationController
  def create
    @link = Link.find(params[:link_id])
    comment = @link.comments.new(comment_params)
    comment.user = current_user
    comment.save
    
    redirect_to @link
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.link
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
