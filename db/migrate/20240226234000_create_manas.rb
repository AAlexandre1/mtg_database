class CreateManas < ActiveRecord::Migration[7.1]
  def change
    create_table :manas do |t|
      t.string :color
      t.integer :quantity

      t.timestamps
    end
  end
end
