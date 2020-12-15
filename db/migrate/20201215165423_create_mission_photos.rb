class CreateMissionPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :mission_photos do |t|
      t.references :missions
      t.string :name, null: false
      t.decimal :altitude, precision: 8, scale: 3
      t.decimal :lat, precision: 12, scale: 8
      t.decimal :lng, precision: 12, scale: 8
      t.timestamps
    end
  end
end
