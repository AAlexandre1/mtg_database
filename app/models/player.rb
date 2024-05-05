class Player < ApplicationRecord
    has_many :decks
    has_many :cards
    has_many :wishlist_cards, through: :cards
    has_many :player_cards, through: :cards

    # has_secure_password

    validates :username, presence: :true, uniqueness: :true
    # validates :password, presence: true, confirmation: true
    # validates :password_confirmation, presence: true, on: :create

end