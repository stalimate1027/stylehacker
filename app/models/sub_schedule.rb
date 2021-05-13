class SubSchedule < ApplicationRecord
  belongs_to :schedule


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :importance
  belongs_to :limit


  with_options presence: true do
    validates :title
    validates :date_id
    validates :importance_id
  end
end
