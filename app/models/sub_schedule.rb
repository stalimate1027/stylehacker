class SubSchedule < ApplicationRecord
  belongs_to :schedule

  with_options presence: true do
    validates :title
    validates :date_id
    validates :importance_id
  end
end
