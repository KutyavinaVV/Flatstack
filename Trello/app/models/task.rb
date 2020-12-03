# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :list

  scope :actual, -> { where('created_at > ?', Date.today - 1.month) }

  before_save :up

  private

  def up
    self.title = title.upcase
  end
end
