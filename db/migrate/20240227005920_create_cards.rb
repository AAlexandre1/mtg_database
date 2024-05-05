class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :set
      t.integer :toughness
      t.integer :power
      t.string :img
      t.text :description

      t.timestamps
    end
  end
end
