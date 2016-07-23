class Vote < ActiveRecord::Base
  belongs_to :entry, polymorphic: true
  belongs_to :user
end
