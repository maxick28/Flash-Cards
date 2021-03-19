require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
    @front = "Word #{rand(100)}"
  end

  test 'should get index' do
    get collection_cards_url
    assert_response :success
  end

  test 'should get new' do
    get new_collection_card_url
    assert_response :success
  end

  test 'should create card' do
    assert_difference('Card.count') do
      post collection_cards_url, params: {
        card: {
          front: @front,
          back: @card.back,
          category: @card.category
        }
      }
    end

    assert_redirected_to collection_url(@collection)
  end

  test 'should show card' do
    get collection_card_url(@collection, @card)
    assert_response :success
  end

  test 'should get edit' do
    get edit_collection_card_url(@collection, @card)
    assert_response :success
  end

  test 'should update card' do
    patch collection_card_url(@collection, @card), params: {
      card: {
        front: @front,
        back: @card.back,
        category: @card.category
      }
    }

    assert_redirected_to collection_url(@collection)
  end

  test 'should destroy card' do
    assert_difference('Card.count', -1) do
      delete collection_card_url(@collection, @card)
    end

    assert_redirected_to collection_url(@collection)
  end
end
