class CreateAnswers < ActiveRecord::Migration
  def change
      create_table :answers do |t|
      t.string :content
      t.belongs_to :user_id, index: true
      t.belongs_to :question_id, index: true

      t.timestamps null: false
    end
  end
end
