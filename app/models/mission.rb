# frozen_string_literal: true

class Mission < ApplicationRecord
  has_many :photos, class_name: 'MissionPhoto',
                    foreign_key: 'mission_id',
                    dependent: :destroy
end
