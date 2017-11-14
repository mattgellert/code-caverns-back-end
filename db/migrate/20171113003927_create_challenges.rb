class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.text :data
      t.integer :xPos
      t.integer :yPos
      t.integer :mapDeltaX
      t.integer :mapDeltaY

      t.timestamps
    end
  end
end
