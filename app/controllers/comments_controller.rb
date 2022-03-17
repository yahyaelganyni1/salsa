class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(text: comment_params[:text], user: current_user)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to product_path(@product.id), notice: 'Comment added!' }
      else
        format.html { redirect_to user_product_path(product.user.id, product.id), alert: 'Failed to add comment!' }
      end
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end
