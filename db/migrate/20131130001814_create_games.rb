class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player1
      t.integer :player2
      t.integer :p1_score
      t.integer :p2_score
      t.integer :winner
      t.integer :loser
      t.boolean :draw
      t.string :location
      t.datetime :date_played

      t.timestamps
    end
  end
end
