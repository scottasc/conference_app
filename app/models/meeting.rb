class Meeting < ApplicationRecord

  # validates :title, presence: true

  # validates :agenda, presence: true
  # validates :agenda, length: { minimum: 15 }

  # validates :time, presence: true

  # validates :location, presence: true

  belongs_to :speaker

end
