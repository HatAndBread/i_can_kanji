class StudySet < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :user, message: "That name has already been usedf.text_area :attribute" }
  belongs_to :user
  has_many :words, dependent: :destroy
end
