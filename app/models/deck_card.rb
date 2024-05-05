class DeckCard < ApplicationRecord
  belongs_to :card
  belongs_to :deck
  
  validate :card_in_player_wishlist_cards

  def card_in_player_wishlist_cards
    player_cards = player.player_cards
    wishlist_cards = player.wishlist_cards

    unless player_cards.include?(card) || wishlist_cards.include?(card)
      errors.add(:base, "The card must be in player cards or wishlist cards to be added to a deck.")
    end
  end
end
