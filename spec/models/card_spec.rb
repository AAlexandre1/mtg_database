require 'rails_helper'

RSpec.describe Card, type: :model do
  
  describe 'factory' do
    it 'is valid' do
      card = create(:card)
      expect(card).to be_valid
    end
  end
  
  
  describe 'validations' do
    let(:card) { FactoryBot.create(:card) }
    
    it 'is valid with valid attributes' do
      expect(card).to be_valid
    end

    it 'is not valid without a name' do
      card.name = nil
      expect(card).not_to be_valid
      expect(card.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without a set' do
      card.set = nil
      expect(card).not_to be_valid
      expect(card.errors[:set]).to include("can't be blank")
    end
    
    it 'is not valid without a power' do
      card.power = nil
      expect(card).not_to be_valid
      expect(card.errors[:power]).to include("can't be blank")
    end

    it 'is not valid without a toughness' do
      card.toughness = nil
      expect(card).not_to be_valid
      expect(card.errors[:toughness]).to include("can't be blank")
    end

    it 'is not valid without a description' do
      card.description = nil
      expect(card).not_to be_valid
      expect(card.errors[:description]).to include("can't be blank")
    end

    # it 'is valid without an image link' do
    #   # card.image = 'https://example.com/image.jpg'
    #   expect(card).to be_valid
    # end

    # it 'is not valid with an invalid image link' do
    #   card.image = 'invalid_image_link'
    #   expect(card).not_to be_valid
    #   expect(card.errors[:image]).to include("is invalid")
    # end

  end
end
