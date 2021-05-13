class Schedule < ApplicationRecord
  has_many   :comments
  has_many   :sub_schedules
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :importance
  belongs_to :limit

  with_options numericality: { other_than: 1 } do
    validates :time_id
    validates :importance_id
  end

  validates :title,   presence: true
  validates :date_id, presence: true
end
