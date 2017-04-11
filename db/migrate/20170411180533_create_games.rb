class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :possible_ids, array: true, default: []
      t.integer :asked_question_ids, array: true, default: []
      t.integer :current_question_id

      t.timestamps
    end
  end
end
