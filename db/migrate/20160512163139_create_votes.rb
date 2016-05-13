class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :entry_id, null: false
      t.string :entry_type, null: false

      t.integer :user_id, null: false
      t.integer :reaction, null: false

      t.timestamps null: false
    end

    add_index :votes, :entry_id
  end
end
