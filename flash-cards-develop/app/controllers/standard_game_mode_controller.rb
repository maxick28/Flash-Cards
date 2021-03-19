class StandardGameModeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_collection

  def index
    @card = @collection.cards.first
  end

  def start
    @current_card = @collection.cards.first
    @offset = 1

    score = current_user.scores.build(collection_id: @collection.id)
    if score.save!
      @game_id = score.id
    else
      # TODO: should be logger and redirect
      puts "************************** Score wasn't saved"
    end
  end

  def next_card
    # if card was skipped - add it's id to database
    if params[:skipped_card]
      score = Score.find(params[:game_id])
      score.skipped_cards.push(params[:skipped_card].to_i)
      score.save!
    end

    # check if we still have cards
    if params[:offset].to_i < @collection.cards.count
      @current_card = @collection.cards.offset(params[:offset]).first

      @offset = params[:offset].to_i + 1
      @game_id = params[:game_id]
    else
      score = Score.find(params[:game_id])
      score.spent_time = (Time.now - score.created_at).to_i
      score.status = 'finished'
      score.save!

      @totall_cards_amount = @collection.cards.count
      @skipped_cards_amount = Score.find(params[:game_id]).skipped_cards.size
      # @spent_time = Time.at(score.spent_time).utc.strftime("%M:%S")
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end
end
