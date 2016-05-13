class Comment < ActiveRecord::Base

  belongs_to :user

  # Polymorphic relationship with question or answer (as entry)
  belongs_to :entry, polymorphic: true
  #has_many :votes, as: :entry
end
