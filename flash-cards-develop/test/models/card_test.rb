require 'test_helper'

class CardTest < ActiveSupport::TestCase
  setup do
    @card = Card.new(front: 'Sun',
                     back: 'Сонце',
                     collection_id: 1)
  end

  test 'should save card with valid attributes' do
    assert @card.save
  end

  test 'should not save card without front attribute' do
    @card.front = nil
    assert_not @card.save
  end

  test 'should not save card without back attribute' do
    @card.back = nil
    assert_not @card.save
  end

  test 'should not save card if word is a duplicate' do
    @card.front = cards(:one).front
    assert_not @card.save
  end

  test 'should not save card without collection_id attribute' do
    @card.collection_id = nil
    assert_not @card.save
  end
end
