class Movie < ApplicationRecord
	has_many :schedules, dependent: :destroy
	validates :name, presence: true
	validates :time, presence: true
end
