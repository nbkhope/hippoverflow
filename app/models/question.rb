require_relative 'reaction'

class Question < ActiveRecord::Base
  include Reaction

  belongs_to :user
  has_many :answers

  # For polymorphic relationships
  has_many :comments, as: :entry
  has_many :votes, as: :entry

  def author
    self.user.username
  end


end

