class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  # For polymorphic relationships
  has_many :comments, as: :entry
  has_many :votes, as: :entry
end
