require 'rails_helper'

RSpec.describe Card, type: :model do
  fixtures :collections
  fixtures :cards

  subject do
    Card.new(front: 'Sun',
             back: 'Сонце',
             collection_id: 1)
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a front' do
      subject.front = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a back' do
      subject.back = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a collection_id' do
      subject.collection_id = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a unique word' do
      subject.front = cards(:hello).front
      expect(subject).to_not be_valid
    end
  end
end
