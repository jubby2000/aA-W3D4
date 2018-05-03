class CreateAnswerChoice < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_choices do |t|
      t.text :answer_choice, null: false
      t.integer :question_id, null: false

      t.timestamp
    end
    add_index :answer_choices, :question_id
  end
end
