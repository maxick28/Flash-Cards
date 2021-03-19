class CardsController < ApplicationController
  before_action :set_collection
  before_action :set_card, only: %w[show edit update destroy]

  def show; end

  def new
    @card = @collection.cards.build
  end

  def create
    @card = @collection.cards.build(card_params)
    respond_to do |format|
      if @card.save
        format.html { redirect_to @collection, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @collection, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to collection_path(@collection), notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def set_card
    @card = @collection.cards.find(params[:id])
  end

  def card_params
    params.require(:card)
          .permit(:front, :back, :image_file_name, :category)
  end
end
