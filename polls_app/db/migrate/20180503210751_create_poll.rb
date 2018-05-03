class CreatePoll < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.timestamp
    end
    add_index :polls, :title
  end
end
