class Link < ActiveRecord::Base
  attr_accessible :title, :url, :user_id

  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  belongs_to :user

  validates :url, presence: true
  validates :title, presence: true
end
