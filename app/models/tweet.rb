class Tweet < ApplicationRecord
  has_many :votes

  validates :text, presence: true, length: { maximum: 140 }, uniqueness: true
  validates :user_name, presence: true # long version  { :presence => true }

  def upvote_count
    votes.where(upvote: true).count
  end

  def downvote_count
    votes.where(upvote: false).count
  end

  def net
    (upvote_count - downvote_count)
  end

  def not_already_voted?(user)
    votes.where(user: user).count == 0  # user: user  ->   hash
  end
end
