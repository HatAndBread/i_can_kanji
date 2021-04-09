class StudySet < ApplicationRecord
  validates :column, presence: true
  belongs_to :user
  has_many :words, dependent: :destroy
end
