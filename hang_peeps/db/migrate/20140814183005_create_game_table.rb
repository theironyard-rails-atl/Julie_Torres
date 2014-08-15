class CreateGameTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :answer
      t.integer :max_misses
      t.integer :misses
      t.string :guessed
      t.timestamps #created_at, updated_at
    end
  end
end
