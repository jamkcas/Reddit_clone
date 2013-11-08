class Vote < ActiveRecord::Base
  attr_accessible :up_down, :user_id, :votable_id, :votable_type

  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :up_down, presence: true

end
