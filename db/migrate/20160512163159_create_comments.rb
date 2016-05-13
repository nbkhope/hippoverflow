class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.belongs_to :user_id, index: true

      t.integer :entry_id, null: false
      t.string :entry_type, null: false
      # You could also do:
      # t.references :entry, polymorphic: true, index: true

      t.timestamps null: false
    end

    add_index :comments, :entry_id

  end
end
