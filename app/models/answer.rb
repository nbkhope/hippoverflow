class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  # For polymorphic relationships
  has_many :comments, as: :entry
  has_many :votes, as: :entry
end
