class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :content
      t.belongs_to :user_id, index: true

      t.timestamps null: false
    end
  end
end
