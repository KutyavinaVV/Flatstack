class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :title, presence: true, length: { maximum: 15 }
  validates :title, presence: true, length: { minimum: 3 }

  scope :actual, -> { where('created_at > ?', Date.today - 1.month) }

end
