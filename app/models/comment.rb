class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  validates :text, presence: true
end
