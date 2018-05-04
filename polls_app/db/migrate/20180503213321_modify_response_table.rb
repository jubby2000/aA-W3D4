class ModifyResponseTable < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :answer_id, :integer, null: false
    remove_column :responses, :question_id
  end
end
