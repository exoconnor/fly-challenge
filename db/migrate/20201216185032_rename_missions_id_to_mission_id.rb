class RenameMissionsIdToMissionId < ActiveRecord::Migration[6.0]
  def change
    rename_column :mission_photos, :missions_id, :mission_id
  end
end
