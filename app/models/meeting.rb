class Meeting < ApplicationRecord

  # validates :title, presence: true

  # validates :agenda, presence: true
  # validates :agenda, length: { minimum: 15 }

  # validates :time, presence: true

  # validates :location, presence: true

  belongs_to :speaker
  has_many :meeting_topics
  has_many :topics, through: :meeting_topics

end
