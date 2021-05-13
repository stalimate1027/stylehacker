class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :schedules
  has_many :comments

  validates :name, presence: true
end
