class AddSpecificToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :specific, :boolean, default: false
  end
end
