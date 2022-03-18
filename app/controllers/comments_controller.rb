class CommentsController < ApplicationController
  #   def create
  #     @product = Product.find(params[:product_id])
  #     @comment = @product.comments.new(text: comment_params[:text], user_id: current_user.id,
  #                                      product_id: params[:product_id])

  #     @comment.user = current_user
  #     respond_to do |format|
  #       if @comment.save
  #         format.html { redirect_to products_path(@product.id), notice: 'Comment added!' }
  #       else
  #         format.html { redirect_to user_products_path(product.user.id, product.id), alert: 'Failed to add comment!' }
  #       end
  #     end
  #   end

  #   private

  #   def comment_params
  #     params.permit(:text)
  #   end

  # before_action set_product

  def create
    :authenticate_user!
    @product = Product.find(params[:product_id])

    @comment = @product.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = 'comment has been created'
      redirect_to product_path(@product)

    elsif flash[:notice] = 'sign in to comment'
      redirect_to new_user_session_path
    end
  end

  def destroy
    :authenticate_user!
    @product = Product.find(params[:product_id])

    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
