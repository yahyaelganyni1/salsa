class CommentsController < ApplicationController
  before_action :set_product

  def create
    :authenticate_user!
    # @product = Product.find(params[:product_id])

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
    # @product = Product.find(params[:product_id])

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
