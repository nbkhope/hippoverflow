module Reaction
  def points
    points = 0
    self.votes.each do |vote|
      points += vote.reaction
    end
    return points
  end
end
