class Deck < ApplicationRecord
  belongs_to :player
  has_many :cards
  has_many :deck_cards, through: :cards

  validate :card_in_player_wishlist_cards

  def card_in_player_wishlist_cards
    player_cards = player.player_cards
    wishlist_cards = player.wishlist_cards

    unless player_cards.include?(card) || wishlist_cards.include?(card)
      errors.add(:base, "The card must be in player cards or wishlist cards to be added to a deck.")
    end
  end
end
