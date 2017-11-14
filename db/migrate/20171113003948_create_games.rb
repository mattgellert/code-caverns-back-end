class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :challenge, foreign_key: true

      t.timestamps
    end
  end
end
