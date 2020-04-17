class Message < ApplicationRecord
  validates :body, presence: true
  scope :recent, -> { order(:created_at).last(20) }
  belongs_to :user
end
