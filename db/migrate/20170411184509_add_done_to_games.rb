class AddDoneToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :done, :boolean
  end
end
