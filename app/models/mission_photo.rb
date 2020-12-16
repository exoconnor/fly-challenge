# frozen_string_literal: true

PHOTO_VARIANTS = {
  thumbnail: { resize: "100x100" }
}

class MissionPhoto < ApplicationRecord
  belongs_to :mission
  has_one_attached :image

  def thumbnail
    image.variant(PHOTO_VARIANTS[:thumbnail]).processed if image.attached?
  end
end
