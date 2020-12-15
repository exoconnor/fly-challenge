class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      # NOTE(connor): ActiveStorage is doing most of the work for this
      # job
      t.string :name, unique: true, null: false
      t.timestamps
    end
  end
end
