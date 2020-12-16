# frozen_string_literal: true

require 'exifr/jpeg'
require 'find'
require 'set'

DATA_DIRECTORY = 'data/'

class ReadMissionDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Pathname("data/").each_child do |mission_dir|
      mission = Mission.find_or_create_by(name: mission_dir.basename.to_s)
      filter_set = mission.photos.pluck(:name).to_set
      Pathname(mission_dir).each_child do |photo_path|
        # NOTE(connor): only unique name X mission accepted
        next if filter_set.member?(photo_path.basename)
        photo = MissionPhoto.create!(
          { name: photo_path.basename.to_s, mission: mission }.merge(exif_gps(photo_path.to_path))
        )
        photo.image.attach io: File.open(photo_path.to_path),
                           filename: photo_path.basename
      end
    end
  end

  private

  # If it's not an image, don't upload

  def exif_gps(path)
    if gps = EXIFR::JPEG.new(path).exif&.fields[:gps]
      {
        lat: gps.fields[:gps_latitude].to_f,
        lng: gps.fields[:gps_longitude].to_f,
        altitude: gps.fields[:gps_altitude].to_f
      }
    end
  rescue EXIFR::MalformedImage, EXIFR::MalformedJPEG => e
    logger.error e
  end
end
