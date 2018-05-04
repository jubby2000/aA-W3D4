class ModifyResponseIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :responses, [:answer_id, :user_id], unique: true
  end
end
