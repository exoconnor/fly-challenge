# frozen_string_literal: true

class MissionPhoto < ApplicationRecord
  belongs_to :mission
  has_one_attached :image
end
