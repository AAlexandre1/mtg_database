class Card < ApplicationRecord
    has_many :deck_cards
    has_many :wishlist_cards
    has_many :player_cards
    has_many :players
    has_many :decks

    has_and_belongs_to_many :types
    has_many :manas

    validates :name, presence: true, uniqueness: true
    validates :set, presence: true
    validates :power, presence: true, numericality: { only_integer: true }
    validates :toughness, presence: true, numericality: { only_integer: true }
    # validates :image, format: { with: URI::DEFAULT_PARSER.make_regexp, allow_blank: true }
    validates :description, presence: true
end
