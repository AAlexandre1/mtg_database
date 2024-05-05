class CreateJoinTableCardMana < ActiveRecord::Migration[7.1]
  def change
    create_join_table :cards, :manas do |t|
      # t.index [:card_id, :mana_id]
      # t.index [:mana_id, :card_id]
    end
  end
end
