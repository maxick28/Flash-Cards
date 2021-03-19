class CollectionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :require_correct_user, only: %i[edit update destroy]
  before_action :set_collection, only: %i[show edit update destroy]

  def index
    @collections = Collection.all
    add_breadcrumb('Collections')
  end

  def my_filter
    category = Category.find(params[:category_id])
    @collections = category.collections
    add_breadcrumb('Collections', collections_path)
    add_breadcrumb("#{category.name} category" )
    render template: 'collections/index', locals: {collections: @collections}
  end

  def show
    @cards = @collection.cards
    @average_rate = @collection.reviews.empty? ? 0 : @collection.reviews.average(:rate)
    @user_review = current_user.reviews.find { |review| review.collection_id == @collection.id }
    category = Category.find(@collection.category_id)
    add_breadcrumb('Collections', collections_path)
    add_breadcrumb("#{category.name} category", collections_my_filter_path({category_id: category.id}) )
    add_breadcrumb(@collection.title)
  end

  def new
    @collection = current_user.collections.build
    add_breadcrumb('Collections', collections_path)
    add_breadcrumb('New')
  end

  def create
    @collection = current_user.collections.build(collection_params)
    if @collection.save
      redirect_to @collection
    else
      render :new
    end
  end

  def edit
    add_breadcrumb('Collections', collections_path)
    add_breadcrumb(@collection.title, collection_path(@collection))
    add_breadcrumb('Edit')
  end

  def update
    if @collection.update(collection_params)
      redirect_to @collection
    else
      render :edit
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_path
  end

  private

  def require_correct_user
    redirect_to @collection unless current_user
  end

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection)
          .permit(:title, :description)
  end
end
