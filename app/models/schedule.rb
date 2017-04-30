class Schedule < ApplicationRecord
  belongs_to :movie
  has_many :seats, dependent: :destroy
  validates :price, presence: true
  validates :stime, presence: true
end
