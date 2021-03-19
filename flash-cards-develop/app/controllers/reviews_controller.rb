class ReviewsController < ApplicationController
  before_action :set_collection
  

  def create
    @review = @collection.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to collection_path(@collection)
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def review_params
    params.require(:review).permit(:rate)
  end
end
