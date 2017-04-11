class CreatePersonAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :person_answers do |t|
      t.integer :person_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
