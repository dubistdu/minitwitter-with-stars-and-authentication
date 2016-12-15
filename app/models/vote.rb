class Vote < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
end
